//
//  MovieListViewModel.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import Foundation

class MovieListViewModel: ObservableObject {

    private var fetchMoviesUseCases: MoviesUseCase
    private var movieListTileMapper: MovieListCardMapper
    private var indexTab: Int = 1

    @Published var isLoading: Bool = false
    @Published var isEmpty: Bool = false
    @Published var results: [MovieListTile] = []
    @Published var errorMessage: String?


    init(fetchMoviesUseCases: MoviesUseCase = MoviesUseCaseImplementation(),
         movieListTileMapper: MovieListCardMapper = MovieListCardMapperImplementation()) {
        self.fetchMoviesUseCases = fetchMoviesUseCases
        self.movieListTileMapper = movieListTileMapper
        fetchMovies(indexTab: indexTab)
    }

    func fetchMovies(indexTab: Int) {
        self.isLoading = true
        self.results = []
        fetchMoviesUseCases.execute({ [weak self] result,error  in
            DispatchQueue.main.async { [weak self] in
                guard let results = self?.movieListTileMapper.map(result) else {
                    return
                }
                self?.isEmpty = results.count == 0
                self?.results = results
                self?.isLoading = false
                if error != nil {
                    self?.handleError(error!)
                }
            }
        }, typeTabMovieSelected: indexTab == 1 ? "NowPlaying" : indexTab == 2 ? "Popular" : "Upcoming")
    }
    func updateTabIndex(_ index: Int) {
        if index == 1 {
            fetchMovies(indexTab: 1)
        } else if index == 2 {
            fetchMovies(indexTab: 2)
        } else {
            fetchMovies(indexTab: 3)
        }
    }
    private func handleError(_ error: MovieErrors) {
        switch error {
            case .apiError(let apiErrorResponse):
                self.errorMessage = apiErrorResponse.statusMessage
            case .loading:
                self.errorMessage = "Loading error"
            case .unauthorized:
                self.errorMessage = "Unauthorized access"
            case .parsing:
                self.errorMessage = "Parsing error"
            case .network(let networkError):
                self.errorMessage = "Network error: \(networkError.localizedDescription)"
            case .none:
                self.errorMessage = "Something Wrong!!!"
        }
    }
}

