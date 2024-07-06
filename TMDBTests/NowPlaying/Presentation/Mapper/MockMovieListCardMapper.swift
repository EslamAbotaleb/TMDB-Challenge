//
//  MockMovieListCardMapper.swift
//  TMDBTests
//
//  Created by Eslam on 06/07/2024.
//

@testable import TMDB

class MockMovieListCardMapper: MovieListCardMapper {
    var numberOfTimesMapMoviesCalled = 0
    var receivedMovies: [MovieListEntity]?
    var movieListUiTiles: [MovieListTile] = []
    func map(_ movies: [MovieListEntity]) -> [MovieListTile] {
        numberOfTimesMapMoviesCalled += 1
        receivedMovies = movies
        return movieListUiTiles
    }
}
