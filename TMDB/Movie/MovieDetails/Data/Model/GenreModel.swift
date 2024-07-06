//
//  GenreModel.swift
//  TMDB
//
//  Created by Eslam on 07/07/2024.
//

import Foundation

struct Genre: Decodable {
    let id: Int?
    let name: String?
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
}
extension Genre: Equatable {
    static func == (lhs: Genre, rhs: Genre) -> Bool {
        return lhs.id == rhs.id
    }
}
extension Genre: Identifiable {}
