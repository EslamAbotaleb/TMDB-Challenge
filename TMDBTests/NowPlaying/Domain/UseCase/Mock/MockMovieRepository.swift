//
//  MockMovieRepository.swift
//  TMDBTests
//
//  Created by Eslam on 06/07/2024.
//

@testable import TMDB

class MockMovieRepository: MoviesRepository {
    var fetchMoviesCalledCounter = 0
    var fetchMoviesCompletionHandler: FetchMoviesCompletionHandler?
    func fetchMovies(result: @escaping FetchMoviesCompletionHandler) {
        fetchMoviesCalledCounter += 1
        fetchMoviesCompletionHandler = result
    }
}
