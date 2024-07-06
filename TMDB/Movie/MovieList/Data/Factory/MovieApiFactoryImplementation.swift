//
//  MovieApiFactoryImplementation.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import Foundation
struct MovieApiFactoryImplementation: MovieApiFactory {
    func createNowPlayingUrl() -> URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = HostNameBaseUrls.hostMovieDB.rawValue
        components.path = AbsolutePathUrl.nowPlaying.rawValue
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "language", value: "en-US"),
          URLQueryItem(name: "page", value: "1"),
        ]
        components.queryItems = components.queryItems.map {$0 + queryItems} ?? queryItems
        return components
    }
    func createPopularUrl() -> URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = HostNameBaseUrls.hostMovieDB.rawValue
        components.path = AbsolutePathUrl.popular.rawValue
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "language", value: "en-US"),
          URLQueryItem(name: "page", value: "1"),
        ]
        components.queryItems = components.queryItems.map {$0 + queryItems} ?? queryItems
        return components
    }
}
