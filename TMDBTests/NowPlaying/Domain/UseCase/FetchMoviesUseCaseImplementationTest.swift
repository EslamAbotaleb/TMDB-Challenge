//
//  FetchMoviesUseCaseImplementationTest.swift
//  TMDBTests
//
//  Created by Eslam on 06/07/2024.
//

import XCTest
@testable import TMDB

class FetchMoviesUseCaseImplementationTest: XCTestCase {
    private var systemUnderTest: MoviesUseCaseImplementation!
    private var mockMovieRepository: MockMovieRepository!

    override func setUp() {
        mockMovieRepository = MockMovieRepository()
        systemUnderTest = MoviesUseCaseImplementation(movieRepository: mockMovieRepository)
    }

    func test_Execute_WhenRequestNowPlayingMoviesPerformedSuccessfully() {
        // Arrange
        systemUnderTest.execute ({ movies,typeTabMovie  in
        },typeTabMovieSelected: "NowPlaying")
        mockMovieRepository.fetchMoviesCompletionHandler?(.success([]))
        mockMovieRepository.fetchMoviesCalledCounter = 0

        // Act
        systemUnderTest.execute ({ movies,typeTabMovie  in
        },typeTabMovieSelected: "NowPlaying")

        // Assert
        XCTAssertNotEqual(mockMovieRepository.fetchMoviesCalledCounter, 1)
        XCTAssertEqual(mockMovieRepository.fetchMoviesCalledCounter, 0)
    }
}
