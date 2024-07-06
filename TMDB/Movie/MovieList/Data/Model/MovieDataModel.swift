//
//  MovieDataModel.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import Foundation
struct MovieItemDataModel: Decodable {
    let title: String?
    let releaseDate: String?
    let posterPath: String?
    let adult: Bool?
    let genreIds: [Int]?
    let id: Int?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case adult = "adult"
        case genreIds = "genre_ids"
        case id = "id"
        case popularity = "popularity"
        case video = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case overview = "overview"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
        posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath)
        adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
        genreIds = try values.decodeIfPresent([Int].self, forKey: .genreIds)
        popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
        voteAverage = try values.decodeIfPresent(Double.self, forKey: .voteAverage)
        voteCount = try values.decodeIfPresent(Int.self, forKey: .voteCount)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        video = try values.decodeIfPresent(Bool.self, forKey: .video)
        originalTitle = try values.decodeIfPresent(String.self, forKey: .originalTitle)
        originalLanguage = try values.decodeIfPresent(String.self, forKey: .originalLanguage)
    }
    init(title: String?,
         releaseDate: String?,
         posterPath: String?,
         adult: Bool?,
         genreIds: [Int]?,
         id: Int?,
         originalLanguage: String?,
         originalTitle: String?,
         overview: String?,
         popularity: Double?,
         video: Bool?,
         voteAverage: Double?,
         voteCount: Int?) {
        self.title = title
        self.releaseDate = releaseDate
        self.posterPath = posterPath
        self.adult = adult
        self.genreIds = genreIds
        self.id = id
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}
