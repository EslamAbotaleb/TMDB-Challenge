//
//  MovieListCard.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import Foundation

class MovieListTile {
    let title: String
    let posterPath: String
    let releaseDate: String
    let id: Int

    init(movie: MovieListEntity) {
        self.title = movie.title
        self.posterPath = movie.posterMovie
        self.releaseDate = movie.releaseDate
        self.id = movie.id
    }
}
extension MovieListTile: Equatable {
    static func == (lhs: MovieListTile, rhs: MovieListTile) -> Bool {
        return lhs.title == rhs.title &&
        lhs.posterPath == rhs.posterPath &&
        lhs.releaseDate == rhs.releaseDate &&
        lhs.id == rhs.id
    }
}
extension MovieListTile: Identifiable {}

