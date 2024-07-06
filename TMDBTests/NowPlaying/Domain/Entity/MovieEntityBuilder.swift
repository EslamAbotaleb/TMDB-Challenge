//
//  MovieEntityBuilder.swift
//  TMDBTests
//
//  Created by Eslam on 06/07/2024.
//

import Foundation
@testable import TMDB
class MovieEntityBuilder {
    private var title: String = ""
    private var releaseDate: String = ""
    private var id: Int = 0

    static func createInstanceObject() -> MovieEntityBuilder {
        return MovieEntityBuilder()
    }

    func with(title: String) -> MovieEntityBuilder {
        self.title = title
        return self
    }
    func with(releaseDate: String) -> MovieEntityBuilder {
        self.releaseDate = releaseDate
        return self
    }
    func with(id: Int) -> MovieEntityBuilder {
        self.id = id
        return self
    }
    func build() -> MovieListEntity {
        return MovieListEntity(id: id, title: title, releaseDate: releaseDate, posterMovie: "")
    }
}
