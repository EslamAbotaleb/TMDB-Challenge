//
//  MockUrlSession.swift
//  TMDBTests
//
//  Created by Eslam on 06/07/2024.
//

import Foundation
@testable import TMDB

class MockUrlSession: URLSessionRequestResponseProtocol {

    var receivedDataTaskCompletionHandler: ((Data?, URLResponse?, Error?) -> Void)?
    var dataTaskWasReturnFromURLSessionDataTask: URLSessionDataTask = MockURLSessionDataTask()
    var numberOfDataTaskCalled = 0
    var dataTaskURL: URL?

    func dataTask(with urlRequest: URLRequest, completionHandler: @escaping TMDB.URLSessionRequestResponseCompletionHandler) -> URLSessionDataTask {
        numberOfDataTaskCalled += 1
        dataTaskURL = urlRequest.url
        receivedDataTaskCompletionHandler = completionHandler
        return dataTaskWasReturnFromURLSessionDataTask
    }
}
