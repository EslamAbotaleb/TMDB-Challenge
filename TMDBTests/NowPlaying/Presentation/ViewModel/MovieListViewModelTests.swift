//
//  MovieListViewModelTests.swift
//  TMDBTests
//
//  Created by Eslam on 06/07/2024.
//

import XCTest
@testable import TMDB

class MovieListViewModelTests: XCTestCase {
    var systemUnderTest: MovieListViewModel!
    var mockFetchMoviesUseCase: MockFetchMoviesUseCase!
    var mockMovieListUiTileMapper: MockMovieListCardMapper!

    override func setUp() {
        mockFetchMoviesUseCase = MockFetchMoviesUseCase()
        mockMovieListUiTileMapper = MockMovieListCardMapper()
        systemUnderTest = MovieListViewModel(fetchMoviesUseCases: mockFetchMoviesUseCase, movieListTileMapper: mockMovieListUiTileMapper)
    }

    func testFetchMovies_NowPlaying_InCaseLoaded() {
        // Arrange
        systemUnderTest.isEmpty = true

        // Act /* indexTab = 1 for now playing tab */
        systemUnderTest.fetchMovies(indexTab: 1)

        // Assert
        XCTAssertEqual(systemUnderTest.isLoading, true)
    }
    func testFetchMovies_NowPlayingCardMapperIsCalledOnce() {
        // Arrange
        let movies = [
            MovieEntityBuilder.createInstanceObject().with(id: 786892).with(title: "Furiosa: A Mad Max Saga").with(releaseDate: "2024-05-22").build()
        ]

        // Act
        systemUnderTest.fetchMovies(indexTab: 1)
        mockMovieListUiTileMapper.receivedMovies = [MovieListEntity(id: 786892, title: "Furiosa: A Mad Max Saga", releaseDate: "2024-05-22", posterMovie: "")]
        mockFetchMoviesUseCase.receivedCompletionHandler?(movies, nil)

        // Assert
        XCTAssertEqual(mockMovieListUiTileMapper.numberOfTimesMapMoviesCalled, 0)
        XCTAssertEqual(mockMovieListUiTileMapper.receivedMovies, movies)
    }
}
