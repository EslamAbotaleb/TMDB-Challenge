//
//  DetailsMovieItemDataModel.swift
//  TMDB
//
//  Created by Eslam on 07/07/2024.
//

import Foundation

struct DetailsMovieItemDataModel: Decodable {
    let title: String?
    let releaseDate: String?
    let genresMovie: [Genre]?
    let id: Int?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let video: Bool?
    let voteAverage: Double?
    let runtime: Int?
    let posterPath: String?
    let tagline: String?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case genresMovie = "genres"
        case id = "id"
        case tagline = "tagline"
        case popularity = "popularity"
        case video = "video"
        case voteAverage = "vote_average"
        case overview = "overview"
        case runtime = "runtime"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
        posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath)
        popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
        voteAverage = try values.decodeIfPresent(Double.self, forKey: .voteAverage)
        runtime = try values.decodeIfPresent(Int.self, forKey: .runtime)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        video = try values.decodeIfPresent(Bool.self, forKey: .video)
        originalTitle = try values.decodeIfPresent(String.self, forKey: .originalTitle)
        originalLanguage = try values.decodeIfPresent(String.self, forKey: .originalLanguage)
        tagline = try values.decodeIfPresent(String.self, forKey: .tagline)
        genresMovie = try values.decodeIfPresent([Genre].self, forKey: .genresMovie)
    }
}
