//
//  MockMovieListCardMapperImplementationTests.swift
//  TMDBTests
//
//  Created by Eslam on 06/07/2024.
//

import XCTest
@testable import TMDB

class MockMovieListCardMapperImplementationTests: XCTestCase {
    var systemUnderTest: MovieListCardMapperImplementation!

    override func setUp() {
        systemUnderTest = MovieListCardMapperImplementation()
    }

    func test_RetrievedNowPlayingMoviesCardUI() {
        //Arrange
        let movie = MovieEntityBuilder.createInstanceObject().build()
        let movieListCardUI = MovieCardUIBuilder.createInstanceObject().with(movie: movie).build()

        //Act
        let result = systemUnderTest.map([movie])

        //Assert
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first, movieListCardUI)
    }
}
