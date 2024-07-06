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
    func fetchPopularMovies(result: @escaping FetchMoviesCompletionHandler) {

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
