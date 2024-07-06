//
//  MockJsonDecode.swift
//  TMDBTests
//
//  Created by Eslam on 06/07/2024.
//

import Foundation
@testable import TMDB

class MockJSONDecoder: JSONDecoderProtocol {
    var result: Result<MovieDataModel, Error>? = .failure(NSError(domain: "", code: 0, userInfo: nil))
    var decodeWithErrorHandlingCalledApiRequest = 0
    var retrievedData: Data?

    func decodeRequestWithErrorHandling<T>(_ type: T.Type, from data: Data) -> (Result<T, Error>) where T : Decodable {
        decodeWithErrorHandlingCalledApiRequest += 1
        retrievedData = data
        return result as! Result<T, Error>
    }
}
