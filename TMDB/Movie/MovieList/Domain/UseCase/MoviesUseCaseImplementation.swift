//
//  MoviesUseCaseImplementation.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import Foundation

class MoviesUseCaseImplementation: MoviesUseCase {
    let movieRepository: MoviesRepository

    init(movieRepository: MoviesRepository) {
        self.movieRepository = movieRepository
    }

    func execute(_ completionHandler: @escaping MoviesUseCaseCompletionHandler, typeTabMovieSelected: String) {
        switch typeTabMovieSelected {
            case TypeTabsMovie.NowPlaying.rawValue:
                movieRepository.fetchNowPlayingMovie { result in
                    switch result {
                        case .success(let responseResult):
                            completionHandler(responseResult,nil)
                        case .failure(let error):
                            completionHandler([],error)
                    }
                }
            case TypeTabsMovie.Popular.rawValue:
                movieRepository.fetchPopularMovies { result in
                }
            default:
                movieRepository.fetchUpcomingMovie { result in
                }
        }
    }
}
