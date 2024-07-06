//
//  DetailMovieApiFactoryImplementation.swift
//  TMDB
//
//  Created by Eslam on 07/07/2024.
//

import Foundation
struct DetailMovieApiFactoryImplementation: MovieDetailsApiFactory {
    func createMovieDetailsByMovieIdUrl(movieId: Int) -> URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = HostNameBaseUrls.hostMovieDB.rawValue
        components.path = "\(AbsolutePathUrl.detailMovieById.rawValue)\(movieId)"
        return components
    }
}
