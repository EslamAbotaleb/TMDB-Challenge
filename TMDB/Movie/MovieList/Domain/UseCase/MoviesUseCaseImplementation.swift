//
//  MoviesUseCaseImplementation.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import Foundation

class MoviesUseCaseImplementation: MoviesUseCase {
    let movieRepository: MoviesRepository

    init(movieRepository: MoviesRepository) {
        self.movieRepository = movieRepository
    }

    func execute(_ completionHandler: @escaping MoviesUseCaseCompletionHandler, typeTabMovieSelected: String) {

    }
}
