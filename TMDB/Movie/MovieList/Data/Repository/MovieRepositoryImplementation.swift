//
//  MovieRepositoryImplementation.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import Foundation

struct MovieRepositoryImplementation: MoviesRepository {
    let networkRepository: NetworkRepository
    let movieDTOMapper: MoviesDTOMapper
    let moviesFactory: MovieApiFactory
    let jsonDecoder: JSONDecoderProtocol

    init(networkRepository: NetworkRepository = NetworkRepositoryImplementation(), movieDTOMapper: MoviesDTOMapper = MovieDTOMapperImplementation(), moviesFactory: MovieApiFactory = MovieApiFactoryImplementation(), jsonDecoder: JSONDecoderProtocol = JSONDecoder()) {
        self.networkRepository = networkRepository
        self.movieDTOMapper = movieDTOMapper
        self.moviesFactory = moviesFactory
        self.jsonDecoder = jsonDecoder
    }

    func fetchNowPlayingMovies(result: @escaping FetchMoviesCompletionHandler) {
        guard let url = moviesFactory.createNowPlayingUrl().url else {
            result(.failure(.loading))
            return
        }
        networkRepository.fetchRequest(url) { resultResponse in
            switch resultResponse {
                case .success(let response):
                    let (responseRequest, data) = response
                    guard responseRequest.statusCode == 200 else {
                        do {
                            let errorResponse =  jsonDecoder.decodeRequestWithErrorHandling(APIErrorResponse.self, from: data)
                            return result(.failure(.apiError(try errorResponse.get())))
                        } catch {
                            return result(.failure(.parsing))
                        }
                    }
                    self.parseDataResponseRequest(data: data, result: result)
                case .failure(_):
                    result(.failure(.loading))
            }
        }
    }
}

extension MovieRepositoryImplementation {
    private func parseDataResponseRequest(data: Data, result: @escaping FetchMoviesCompletionHandler) {
        let decodeResult = jsonDecoder.decodeRequestWithErrorHandling(MovieDataModel.self, from: data)
        switch decodeResult {
            case .success(let results):
                let resultResponse = movieDTOMapper.map(results)
                result(.success(resultResponse))
            case .failure:
                result(.failure(.parsing))
        }
    }
}
