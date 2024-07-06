//
//  UpcomingMoviesView.swift
//  TMDB
//
//  Created by Eslam on 07/07/2024.
//

import SwiftUI

struct UpcomingMoviesView: View {
    @ObservedObject var viewModel: MovieListViewModel

    var body: some View {
        TypeMovieView(viewModel: viewModel, typeTabMovie: TypeTabsMovie.UpcomingMovies.rawValue)
    }
}

