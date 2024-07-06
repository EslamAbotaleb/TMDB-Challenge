//
//  MovieDetailsApiFactory.swift
//  TMDB
//
//  Created by Eslam on 07/07/2024.
//

import Foundation
protocol MovieDetailsApiFactory {
    func createMovieDetailsByMovieIdUrl(movieId: Int) -> URLComponents
}
