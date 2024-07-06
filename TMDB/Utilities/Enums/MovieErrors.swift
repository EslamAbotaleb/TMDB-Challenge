//
//  MovieErrors.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import Foundation

enum MovieErrors: Error {
    case loading
    case unauthorized
    case parsing
    case apiError(APIErrorResponse)
    case network(Error)
    case none
}

