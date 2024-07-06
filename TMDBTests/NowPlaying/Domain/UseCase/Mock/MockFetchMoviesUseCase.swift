//
//  MockFetchMoviesUseCase.swift
//  TMDBTests
//
//  Created by Eslam on 06/07/2024.
//

@testable import TMDB

class MockFetchMoviesUseCase: MoviesUseCase {
//    var executeCalledCounter = 0
    var typeTabMovieSelected = ""
    var receivedCompletionHandler: MoviesUseCaseCompletionHandler?

    func execute(_ completionHandler: @escaping MoviesUseCaseCompletionHandler, typeTabMovieSelected: String) {
//        executeCalledCounter += 1
        self.typeTabMovieSelected = typeTabMovieSelected
        receivedCompletionHandler = completionHandler
    }
}

