//
//  MovieListCardMapperImplementation.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import Foundation
struct MovieListCardMapperImplementation: MovieListCardMapper {
    func map(_ results: [MovieListEntity]) -> [MovieListTile] {
        var result: [MovieListTile] = []
        for movie in results {
            result.append(MovieListTile(movie: movie))
        }
        return result
    }
}
