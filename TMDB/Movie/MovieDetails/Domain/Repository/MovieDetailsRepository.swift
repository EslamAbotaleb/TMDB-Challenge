//
//  MovieDetailsRepository.swift
//  TMDB
//
//  Created by Eslam on 07/07/2024.
//

import Foundation

typealias FetchMovieDetailsResult = (_ result: Result<MovieDetailsEntity, MovieErrors>) -> Void

protocol MovieDetailsRepository {
    func fetchMovieDetailsById(result: @escaping FetchMovieDetailsResult, movieId: Int)
}
