//
//  JsonDecoder + Extesntion.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import Foundation

extension JSONDecoder: JSONDecoderProtocol {
    func decodeRequestWithErrorHandling<T>(_ type: T.Type, from data: Data) -> (Result<T, any Error>) where T : Decodable {
        do {
            return .success(try JSONDecoder().decode(type, from: data))
        } catch {
            return .failure(error)
        }
    }
}
