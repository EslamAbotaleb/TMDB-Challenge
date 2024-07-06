//
//  ErrorResponse.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import Foundation
struct APIErrorResponse: Decodable {
    let success: Bool?
    let statusCode: Int?
    let statusMessage: String?

    enum CodingKeys: String, CodingKey {
        case success
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        statusMessage = try values.decodeIfPresent(String.self, forKey: .statusMessage)
        statusCode = try values.decodeIfPresent(Int.self, forKey: .statusCode)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)

    }
}
