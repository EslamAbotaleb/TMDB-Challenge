//
//  FetchMovieDetailsUseCaseImplementation.swift
//  TMDB
//
//  Created by Eslam on 07/07/2024.
//

import Foundation
class FetchDetailsMovieUseCaseImplementation: FetchDetailMovieUseCase {

    let movieDetailsRepository: MovieDetailsRepository
    init(movieDetailsRepository: MovieDetailsRepository = MovieDetailsRepositoryImplementation()) {
        self.movieDetailsRepository = movieDetailsRepository
    }
    func execute(_ completionHandler: @escaping FetchDetailMovieUseCaseCompletionHandler, movieId: Int) {
        movieDetailsRepository.fetchMovieDetailsById(result: { result in
            switch result {
                case .success(let results):
                    completionHandler(results)
                case .failure:
                    break
            }
        }, movieId: movieId)
    }
}
