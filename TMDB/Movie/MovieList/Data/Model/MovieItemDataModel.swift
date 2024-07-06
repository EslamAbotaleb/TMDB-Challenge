//
//  MovieItemDataModel.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import Foundation

struct MovieDataModel: Decodable {
    let results: [MovieItemDataModel]?
}
