//
//  MovieListEntity.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import Foundation

struct MovieListEntity {
    let id: Int
    let title: String
    let releaseDate: String
    let posterMovie: String
}

extension MovieListEntity: Equatable {}
