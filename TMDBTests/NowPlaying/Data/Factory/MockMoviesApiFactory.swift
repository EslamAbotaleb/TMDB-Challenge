//
//  MockMoviesApiFactory.swift
//  TMDBTests
//
//  Created by Eslam on 06/07/2024.
//

import Foundation
@testable import TMDB

class MockMoviesApiFactory: MovieApiFactory {
    //How many times the now playing api is called
    var createNowPlayingUrlCalledTimes = 0
    var urlComponents: URLComponents = URLComponents()

    func createNowPlayingUrl() -> URLComponents {
        createNowPlayingUrlCalledTimes += 1
        return urlComponents
    }
}
