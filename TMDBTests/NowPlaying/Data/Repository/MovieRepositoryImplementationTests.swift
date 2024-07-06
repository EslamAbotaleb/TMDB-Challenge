//
//  MovieRepositoryImplementationTests.swift
//  TMDBTests
//
//  Created by Eslam on 06/07/2024.
//

import XCTest
@testable import TMDB

class MovieRepositoryImplementationTests: XCTestCase {
    var systemUnderTest: MovieRepositoryImplementation!
    var mockNetworkRepository: MockNetworkRepository!
    var mockMoviesDtOMapper: MockMoviesDTOMapper!
    var mockMoviesApiFactory: MockMoviesApiFactory!
    var mockJSONDecoder: MockJSONDecoder!

    override func setUp() {
        mockNetworkRepository = MockNetworkRepository()
        mockMoviesDtOMapper = MockMoviesDTOMapper()
        mockMoviesApiFactory = MockMoviesApiFactory()
        mockJSONDecoder = MockJSONDecoder()
        systemUnderTest = MovieRepositoryImplementation(networkRepository: mockNetworkRepository, movieDTOMapper: mockMoviesDtOMapper, moviesFactory: mockMoviesApiFactory, jsonDecoder: mockJSONDecoder)
    }

    func testFetchMovies_ApiFactoryNowPlayingUrlIsCalledOnce() {
        // Act
        systemUnderTest.fetchNowPlayingMovies { result in
        }
        // Assert
        XCTAssertEqual(mockMoviesApiFactory.createNowPlayingUrlCalledTimes, 1)
    }
    func testFetchMovies_NetworkRepositoryReturnsFailure_Case() {
        // Arrange
        mockMoviesApiFactory.urlComponents = URLComponents()
        let error = NSError(domain: "", code: 0, userInfo: nil)
        var failureLoadingCalledCounter = 0

        // Act
        systemUnderTest.fetchNowPlayingMovies { result in
            switch result {
            case .failure(let error):
                switch error {
                case .loading:
                    failureLoadingCalledCounter += 1
                default:
                    break
                }
            default:
                break
            }
        }
        mockNetworkRepository.receivedRequestResponseResultCompletionHandler?(.failure(error))

        // Assert
        XCTAssertEqual(failureLoadingCalledCounter, 1)
    }
    func testFetchMovies__NetworkRepositoryForNowPlayingUrl() {
        // Arrange
        mockMoviesApiFactory.urlComponents = URLComponents(string: "https://api.themoviedb.org/3/movie/now_playing")!
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "language", value: "en-US"),
          URLQueryItem(name: "page", value: "1"),
        ]
        mockMoviesApiFactory.urlComponents.queryItems = mockMoviesApiFactory.urlComponents.queryItems.map {$0 + queryItems} ?? queryItems
        // Act
        systemUnderTest.fetchNowPlayingMovies { result in
        }

        // Assert
        XCTAssertEqual(mockNetworkRepository.numberOfRequestCalled, 1)
        XCTAssertEqual(mockNetworkRepository.receivedURL, URL(string: "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1")!)
    }
    func testFetchMovies_NetworkRepositoryFetchRequestWithInStatusCodeOkAndParsingSuccess() {
        // Arrange
        let data = "".data(using: .utf8)!
        mockMoviesApiFactory.urlComponents = URLComponents()
        var successCalledCounter = 0
        var receivedArticleEntity: [MovieListEntity]?
        let moviesEntities = [MovieEntityBuilder.createInstanceObject().with(title: "Furiosa: A Mad Max Saga").build()]
        mockMoviesDtOMapper.movieEntities = moviesEntities
        mockJSONDecoder.result = .success(MovieDataModelBuilder.createInstanceObject().build())

        // Act
        systemUnderTest.fetchNowPlayingMovies { result in
            switch result {
            case .success(let result):
                successCalledCounter += 1
                receivedArticleEntity = result
            default:
                break
            }
        }
        mockNetworkRepository.receivedRequestResponseResultCompletionHandler?(.success((HTTPURLResponse(url: URL(string: "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1")!, statusCode: 200, httpVersion: nil, headerFields: nil)!, data)))

        // Assert
        XCTAssertEqual(successCalledCounter, 1)
        XCTAssertEqual(receivedArticleEntity, moviesEntities)
    }
    func testFetchMovies_NetworkRepositoryFetchRequestInTheCaseUnparsableResponseData_ParsingFailure() {
        // Arrange
        let data = "".data(using: .utf8)!
        mockMoviesApiFactory.urlComponents = URLComponents()
        var failureParsingCalledCounter = 0

        // Act
        systemUnderTest.fetchNowPlayingMovies { result in
            switch result {
            case .failure(let error):
                switch error {
                case .parsing:
                    failureParsingCalledCounter += 1
                default:
                    break
                }
            default:
                break
            }
        }
        mockNetworkRepository.receivedRequestResponseResultCompletionHandler?(.success((HTTPURLResponse(url: URL(string: "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1")!, statusCode: 200, httpVersion: nil, headerFields: nil)!, data)))

        // Assert
        XCTAssertEqual(failureParsingCalledCounter, 1)
    }

}
