//
//  NetworkRepositoryImplementation.swift
//  TMDBTests
//
//  Created by Eslam on 06/07/2024.
//

import XCTest
@testable import TMDB

class NetworkRepositoryImplementationTest: XCTestCase {
    private var mockURLSession: MockUrlSession!
    private var systemUnderTest: NetworkRepositoryImplementation!

    override func setUp() {
        mockURLSession = MockUrlSession()
        systemUnderTest = NetworkRepositoryImplementation(urlSession: mockURLSession)
    }
    override func tearDown() {
        mockURLSession = nil
        systemUnderTest = nil
        super.tearDown()
    }

    func testFetchRequestNowPlaying_WhenSessionDataTask_Success() {
        // Arrange
        let url = URL(string:  "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1")!
        let expectedResponse = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
        var completionResult: Result<(HTTPURLResponse, Data), Error>?
        // Act
        systemUnderTest.fetchRequest(url) { result in
            completionResult = result
        }
        mockURLSession.receivedDataTaskCompletionHandler?(Data(count: 20), expectedResponse, nil)
        // Assert
        XCTAssertNotNil(completionResult)
        // Act
        systemUnderTest.fetchRequest(url) { result in
            switch result {
                case .success(let response):
                    let (responseRequest, data) = response
                    // Assert
                    XCTAssertEqual(responseRequest.statusCode, 200)
                case .failure:
                    // Assert
                    XCTFail("Expected success result, but got failure")
            }
        }
    }
    func test_FetchRequestNowPlaying_WithErrorRetrievedFromDataTask() {
        //Arrange
        let movieUrl = URL(string: "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1")!
        let error = NSError(domain: "api.themoviedb.org", code: 0)

        // Act
        var receivedResult: Result<(HTTPURLResponse, Data), Error>?
        systemUnderTest.fetchRequest(movieUrl) { result in
            receivedResult = result
        }
        mockURLSession.receivedDataTaskCompletionHandler?(nil, nil, error)

        // Assert
        var receivedError: Error?
        if case .failure(let error) = receivedResult {
            receivedError = error
        }
        XCTAssertEqual(receivedError?.localizedDescription, error.localizedDescription)
    }
    func testFetchRequest_OnceURLSessionDataTaskGivenNowPlayingMovieURL() {
        // Arrange
        let movieUrl = URL(string: "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1")!
        // Act
        systemUnderTest.fetchRequest(movieUrl) { _ in

        }
        // Assert
        //XCTAssertEqual(mockURLSession.numberOfDataTaskCalled, 0)
        XCTAssertEqual(mockURLSession.numberOfDataTaskCalled, 1)
        XCTAssertEqual(mockURLSession.dataTaskURL?.absoluteString, movieUrl.absoluteString)
    }
}
