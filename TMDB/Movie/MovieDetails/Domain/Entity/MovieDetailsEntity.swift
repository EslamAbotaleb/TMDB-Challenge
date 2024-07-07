//
//  MovieDetailsEntity.swift
//  TMDB
//
//  Created by Eslam on 07/07/2024.
//

import Foundation
struct MovieDetailsEntity {
    let title: String
    let overView: String
    let runTime: Int
    let genres: [Genre]
}
extension MovieDetailsEntity: Equatable {}
