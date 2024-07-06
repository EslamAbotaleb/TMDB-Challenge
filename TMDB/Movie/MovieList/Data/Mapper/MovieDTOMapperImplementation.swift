//
//  MovieDTOMapperImplementation.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import Foundation

struct MovieDTOMapperImplementation: MoviesDTOMapper {
    func map(_ data: MovieDataModel) -> [MovieListEntity] {
        var moviesResult: [MovieListEntity] = []
        guard let results = data.results else { return [] }
        for movie in results {
            guard let id = movie.id,
                  let title = movie.title,
                  let releaseDate = movie.releaseDate,
                  let posterPath = movie.posterPath
            else { continue }
            let movieEntity = MovieListEntity(id: id, title: title, releaseDate: releaseDate, posterMovie: posterPath)
            moviesResult.append(movieEntity)
        }
        return moviesResult
    }
}
