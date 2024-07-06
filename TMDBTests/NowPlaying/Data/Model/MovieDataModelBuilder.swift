//
//  MovieDataModelBuilder.swift
//  TMDBTests
//
//  Created by Eslam on 06/07/2024.
//

import Foundation
@testable import TMDB

class MovieDataModelBuilder {
    private var movies: [MovieItemDataModel] = []

    static func createInstanceObject() -> MovieDataModelBuilder {
        return MovieDataModelBuilder()
    }

    func with(movies: [MovieItemDataModel]) -> MovieDataModelBuilder {
        self.movies = movies
        return self
    }
    func build() -> MovieDataModel {
        return MovieDataModel(results: movies)
    }
}
