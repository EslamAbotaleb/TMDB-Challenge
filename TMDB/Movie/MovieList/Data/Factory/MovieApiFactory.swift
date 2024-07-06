//
//  MovieApiFactory.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import Foundation
protocol MovieApiFactory {
    func createNowPlayingUrl() -> URLComponents
    func createPopularUrl() -> URLComponents
    func createUpcomingMoviesUrl() -> URLComponents
}

extension MovieApiFactory {
    func createPopularUrl() -> URLComponents {return URLComponents()}
    func createNowPlayingUrl() -> URLComponents {return URLComponents()}
    func createUpcomingMoviesUrl() -> URLComponents {return URLComponents()}
}
