//
//  MovieDetailsUIMapperImplementation.swift
//  TMDB
//
//  Created by Eslam on 07/07/2024.
//

import Foundation
struct MovieDetailsUIMapperImplementation: MovieDetailsTileMapper {
    func map(_ result: MovieDetailsEntity) -> MovieDetailsCard {
        return MovieDetailsCard(movie: result)
    }
}
