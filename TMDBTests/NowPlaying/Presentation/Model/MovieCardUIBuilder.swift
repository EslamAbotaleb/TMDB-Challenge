//
//  MovieCardUIBuilder.swift
//  TMDBTests
//
//  Created by Eslam on 06/07/2024.
//

@testable import TMDB
class MovieCardUIBuilder {
    private var movie: MovieListEntity = MovieEntityBuilder.createInstanceObject().build()

    static func createInstanceObject() -> MovieCardUIBuilder {
        return MovieCardUIBuilder()
    }

    func with(movie: MovieListEntity) -> MovieCardUIBuilder {
        self.movie = movie
        return self
    }
    func build() -> MovieListTile {
        MovieListTile(movie: movie)
    }
}

