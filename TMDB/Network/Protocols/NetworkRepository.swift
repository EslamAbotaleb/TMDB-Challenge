//
//  NetworkRepository.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import Foundation

typealias FetchRequestResponseResult = (_ result: Result<(HTTPURLResponse, Data), Error>) -> Void

protocol NetworkRepository {
    func fetchRequest(_ url: URL, result: @escaping FetchRequestResponseResult)
}
