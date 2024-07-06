//
//  UrlsMovie.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import Foundation

enum HostNameBaseUrls: String {
    case hostName = "api.themoviedb.org"
    case baseImageUrl = "image.tmdb.org"
}
enum AbsolutePathUrl: String {
    case nowPlaying = "/3/movie/now_playing"
    case popular = "/3/movie/popular"
    case upcoming = "/3/movie/upcoming"
    case detailMovieById = "/3/movie/"
}
