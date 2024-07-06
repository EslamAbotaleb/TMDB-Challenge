//
//  MovieDetailsViewModel.swift
//  TMDB
//
//  Created by Eslam on 07/07/2024.
//

import Foundation
class MovieDetailsViewModel: ObservableObject {

    private var fetchDetailMovieUseCases: FetchDetailMovieUseCase
    private var detailMovieTileMapper: MovieDetailsTileMapper

    @Published var isLoading: Bool = false
    @Published var result: MovieDetailsCard?
    @Published var movieId: Int?

    init(movieId: Int, fetchDetailMovieUseCases: FetchDetailMovieUseCase = FetchDetailsMovieUseCaseImplementation(), detailMovieTileMapper: MovieDetailsTileMapper = MovieDetailsUIMapperImplementation()) {
        self.fetchDetailMovieUseCases = fetchDetailMovieUseCases
        self.detailMovieTileMapper = detailMovieTileMapper
        self.movieId = movieId
        fetchMovieDetailsById(movieId: movieId)
    }

    func fetchMovieDetailsById(movieId: Int) {
        fetchDetailMovieUseCases.execute ({ [weak self] results in
            DispatchQueue.main.async { [weak self] in
                guard let resultMovieDetails = self?.detailMovieTileMapper.map(results) else {
                    return
                }
                self?.result = resultMovieDetails
                self?.isLoading = false
            }
        }, movieId: movieId)
    }
}
