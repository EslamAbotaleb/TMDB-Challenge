//
//  MoviesUseCase.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import Foundation

typealias MoviesUseCaseCompletionHandler = (_ results: [MovieListEntity], _ error: MovieErrors?) -> Void

protocol MoviesUseCase {
    func execute(_ completionHandler: @escaping MoviesUseCaseCompletionHandler, typeTabMovieSelected: String)
}
