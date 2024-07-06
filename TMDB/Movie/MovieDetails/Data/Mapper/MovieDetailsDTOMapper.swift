//
//  MovieDetailsDTOMapper.swift
//  TMDB
//
//  Created by Eslam on 07/07/2024.
//

import Foundation
protocol MovieDetailsDTOMapper {
    func map(_ data: DetailsMovieItemDataModel) -> MovieDetailsEntity
}
