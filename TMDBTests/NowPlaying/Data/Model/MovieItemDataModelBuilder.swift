//
//  MovieItemDataModelBuilder.swift
//  TMDBTests
//
//  Created by Eslam on 06/07/2024.
//

import Foundation
@testable import TMDB

class MovieItemDataModelBuilder {
    private var id: Int?
    private var title: String?
    private var releaseDate: String?

    static func createInstanceObject() -> MovieItemDataModelBuilder {
        return MovieItemDataModelBuilder()
    }

    func with(title: String) -> MovieItemDataModelBuilder {
        self.title = title
        return self
    }
    func with(releaseDate: String) -> MovieItemDataModelBuilder {
        self.releaseDate = releaseDate
        return self
    }
    func with(id: Int) -> MovieItemDataModelBuilder {
        self.id = id
        return self
    }

    func build() -> MovieItemDataModel {
        MovieItemDataModel(title: title, releaseDate: releaseDate, posterPath: "", adult: false, genreIds: [], id: id, originalLanguage: "", originalTitle: "", overview: "", popularity: 0.0, video: false, voteAverage: 0.0, voteCount: 0)
    }
}
