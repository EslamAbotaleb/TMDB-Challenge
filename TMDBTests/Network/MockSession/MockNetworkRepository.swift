//
//  MockNetworkRepository.swift
//  TMDBTests
//
//  Created by Eslam on 06/07/2024.
//

import Foundation
@testable import TMDB

class MockNetworkRepository: NetworkRepository {
    var receivedRequestResponseResultCompletionHandler: FetchRequestResponseResult?
    var receivedURL: URL?
    var numberOfRequestCalled = 0

    func fetchRequest(_ url: URL, result: @escaping FetchRequestResponseResult) {
        numberOfRequestCalled += 1
        receivedURL = url
        receivedRequestResponseResultCompletionHandler = result
    }
}
