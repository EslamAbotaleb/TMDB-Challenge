//
//  FetchMovieDetailsUseCase.swift
//  TMDB
//
//  Created by Eslam on 07/07/2024.
//

import Foundation

typealias FetchDetailMovieUseCaseCompletionHandler = (_ results: MovieDetailsEntity) -> Void

protocol FetchDetailMovieUseCase {
    func execute(_ completionHandler: @escaping FetchDetailMovieUseCaseCompletionHandler, movieId: Int)
}
