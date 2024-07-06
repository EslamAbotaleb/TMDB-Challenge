//
//  MockMovieDTOMapper.swift
//  TMDBTests
//
//  Created by Eslam on 06/07/2024.
//

@testable import TMDB

class MockMoviesDTOMapper: MoviesDTOMapper {
    var numOfTimeForMapCalled = 0
    var receivedMovieData: MovieDataModel?
    var movieEntities: [MovieListEntity] = []

    func map(_ data: MovieDataModel) -> [MovieListEntity] {
        numOfTimeForMapCalled += 1
        receivedMovieData = data
        return movieEntities
    }
}
