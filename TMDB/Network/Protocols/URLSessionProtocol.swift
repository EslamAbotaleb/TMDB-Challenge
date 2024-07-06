//
//  URLSessionProtocol.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import Foundation

typealias URLSessionRequestResponseCompletionHandler = @Sendable (Data?, URLResponse?, Error?) -> Void

protocol URLSessionRequestResponseProtocol {
    func dataTask(with urlRequest: URLRequest, completionHandler: @escaping URLSessionRequestResponseCompletionHandler) -> URLSessionDataTask
}

//MARK: - make URLSession default implementation of the dataTask function customizable
extension URLSession : URLSessionRequestResponseProtocol {}
