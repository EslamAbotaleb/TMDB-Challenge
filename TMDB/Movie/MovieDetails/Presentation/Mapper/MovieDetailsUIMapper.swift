//
//  MovieDetailsUIMapper.swift
//  TMDB
//
//  Created by Eslam on 07/07/2024.
//

import Foundation
protocol MovieDetailsTileMapper {
    func map(_ results: MovieDetailsEntity) -> MovieDetailsCard
}
