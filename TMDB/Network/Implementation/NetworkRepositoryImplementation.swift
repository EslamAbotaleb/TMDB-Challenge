//
//  NetworkRepositoryImplementation.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import Foundation

struct NetworkRepositoryImplementation: NetworkRepository {

    let urlSession: URLSessionRequestResponseProtocol

    init(urlSession: URLSessionRequestResponseProtocol) {
        self.urlSession = urlSession
    }

    func fetchRequest(_ url: URL, result: @escaping FetchRequestResponseResult) {
        let dataTask = urlSession.dataTask(with: configureRequest(url)) { 
            dataRequest, response, error in
            if let error {
                return result(.failure(error))
            }
            guard let responseRequest = response as? HTTPURLResponse,
                  let data = dataRequest else {
                      let error = NSError(domain: "error", code: 0, userInfo: nil)
                      result(.failure(error))
                      return
            }
            result(.success((responseRequest, data)))
        }
        dataTask.resume()
    }
}

//MARK: - Prepare HTTPHeader for the request
extension NetworkRepositoryImplementation {
    private func configureRequest(_ url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer "
        ]
        return request
    }
}
