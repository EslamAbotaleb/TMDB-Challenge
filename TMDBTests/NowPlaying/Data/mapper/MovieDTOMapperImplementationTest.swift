//
//  MovieDTOMapperImplementationTest.swift
//  TMDBTests
//
//  Created by Eslam on 06/07/2024.
//

import XCTest
@testable import TMDB

class MovieDTOMapperImplementationTest: XCTestCase {
    var systemUnderTest: MovieDTOMapperImplementation!

    override func setUp() {
        systemUnderTest = MovieDTOMapperImplementation()
    }

    func test_ReturnMappedNowPlayingMovieEntity() {
        //Arrange
        let movieItemDataModel = MovieItemDataModelBuilder.createInstanceObject().with(id: 786892).with(title: "Furiosa: A Mad Max Saga").with(releaseDate: "2024-05-22").build()

        let moviesDataModel = MovieDataModelBuilder.createInstanceObject().with(movies: [movieItemDataModel]).build()

        let expectedMovieEntity = MovieEntityBuilder.createInstanceObject().with(id: 786892).with(title: "Furiosa: A Mad Max Saga").with(releaseDate: "2024-05-22").build()

        //Act
        let result = systemUnderTest.map(moviesDataModel)

        //Assert
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first, expectedMovieEntity)
    }
}
