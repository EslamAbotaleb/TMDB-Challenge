//
//  MoviesDTOMapper.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import Foundation

protocol MoviesDTOMapper {
    func map(_ data: MovieDataModel) -> [MovieListEntity]
}
