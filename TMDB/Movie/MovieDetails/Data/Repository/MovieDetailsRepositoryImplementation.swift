//
//  MovieDetailsRepositoryImplementation.swift
//  TMDB
//
//  Created by Eslam on 07/07/2024.
//

import Foundation

class MovieDetailsRepositoryImplementation: MovieDetailsRepository {

    let networkRepository: NetworkRepository
    let movieDetailsDTOMapper: MovieDetailsDTOMapper
    let jsonDecoder: JSONDecoderProtocol
    let movieDetailsApiFactory: MovieDetailsApiFactory

    init(networkRepository: NetworkRepository = NetworkRepositoryImplementation(), movieDetailsDTOMapper: MovieDetailsDTOMapper = MovieDetailsDTOMapperImplementation(), jsonDecoder: JSONDecoderProtocol = JSONDecoder(), movieDetailsApiFactory: MovieDetailsApiFactory = DetailMovieApiFactoryImplementation()) {
        self.networkRepository = networkRepository
        self.movieDetailsDTOMapper = movieDetailsDTOMapper
        self.jsonDecoder = jsonDecoder
        self.movieDetailsApiFactory = movieDetailsApiFactory
    }

    func fetchMovieDetailsById(result: @escaping FetchMovieDetailsResult, movieId: Int) {
        guard let url = movieDetailsApiFactory.createMovieDetailsByMovieIdUrl(movieId: movieId) .url else {
            result(.failure(.loading))
            return
        }
        networkRepository.fetchRequest(url) { resultResponse in
            switch resultResponse {
                case .success(let response):
                    let (responseRequest, data) = response
                    guard responseRequest.statusCode == 200 else {
                        return result(.failure(.loading))
                    }
                    self.parse(data: data, result: result)
                case .failure:
                    return result(.failure(.loading))
            }
        }
    }
     func parse(data: Data, result: @escaping FetchMovieDetailsResult) {
        let decoderResult = jsonDecoder.decodeRequestWithErrorHandling(DetailsMovieItemDataModel.self, from: data)
        switch decoderResult {
            case .success(let results):
                let resultsPage = movieDetailsDTOMapper.map(results)
                result(.success(resultsPage))
            case .failure:
                result(.failure(.parsing))
        }
    }
}
