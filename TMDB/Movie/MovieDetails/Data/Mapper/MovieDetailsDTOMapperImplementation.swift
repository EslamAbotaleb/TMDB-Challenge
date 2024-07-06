//
//  MovieDetailsDTOMapperImplementation.swift
//  TMDB
//
//  Created by Eslam on 07/07/2024.
//

import Foundation

struct MovieDetailsDTOMapperImplementation: MovieDetailsDTOMapper {
    func map(_ data: DetailsMovieItemDataModel) -> MovieDetailsEntity {
        guard let overView = data.overview,
              let runtime = data.runtime,
              let genres = data.genresMovie else {
            fatalError("movie details not found!!!!")
        }
        let detailsMovie = MovieDetailsEntity(overView: overView, runTime: runtime, genres: genres)
        return detailsMovie
    }
}
