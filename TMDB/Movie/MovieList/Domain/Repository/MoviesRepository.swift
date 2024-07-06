//
//  MoviesRepository.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import Foundation

typealias FetchMoviesCompletionHandler = (_ result: Result<[MovieListEntity], MovieErrors>) -> Void

protocol MoviesRepository {
    func fetchNowPlayingMovies(result: @escaping FetchMoviesCompletionHandler)
    func fetchPopularMovies(result: @escaping FetchMoviesCompletionHandler)
    func fetchUpcomingMovies(result: @escaping FetchMoviesCompletionHandler)
}

extension MoviesRepository {
    func fetchNowPlayingMovies(result: @escaping FetchMoviesCompletionHandler) {

    }
    func fetchPopularMovies(result: @escaping FetchMoviesCompletionHandler) {

    }
    func fetchUpcomingMovies(result: @escaping FetchMoviesCompletionHandler) {
        
    }
}
