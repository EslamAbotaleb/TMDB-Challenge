//
//  JsonDecoder.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import Foundation
protocol JSONDecoderProtocol {
    func decodeRequestWithErrorHandling<T>(_ type: T.Type, from data: Data) -> (Result<T, Error>) where T: Decodable
}
