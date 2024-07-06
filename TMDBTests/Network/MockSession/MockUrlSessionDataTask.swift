//
//  MockUrlSessionDataTask.swift
//  TMDBTests
//
//  Created by Eslam on 06/07/2024.
//

import Foundation
@testable import TMDB

class MockURLSessionDataTask: URLSessionDataTask {
    var numberOfTimesCalledURLSessionRequest = 0

    override init() {
    }

    override func resume() {
        numberOfTimesCalledURLSessionRequest += 1
    }
}
