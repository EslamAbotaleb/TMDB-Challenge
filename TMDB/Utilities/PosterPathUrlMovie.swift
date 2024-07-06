//
//  PosterPathMovie.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import Foundation
struct PosterPathMovieUrlImage {
    static var baseImageUrl: String {
        return "https://\(HostNameBaseUrls.baseImageUrl.rawValue)/t/p/original"
    }
}
