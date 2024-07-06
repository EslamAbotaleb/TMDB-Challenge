//
//  MovieDetailsCard.swift
//  TMDB
//
//  Created by Eslam on 07/07/2024.
//

import Foundation
class MovieDetailsCard: Identifiable {
    let runtime: Int
    let genres: [Genre]
    let overview: String

    init(movie: MovieDetailsEntity) {
        self.overview = movie.overView
        self.runtime = movie.runTime
        self.genres = movie.genres
    }
}
extension MovieDetailsCard: Equatable {
    static func == (lhs: MovieDetailsCard, rhs: MovieDetailsCard) -> Bool {
        return lhs.runtime == rhs.runtime &&
        lhs.overview == rhs.overview &&
        lhs.genres == rhs.genres
    }
}
