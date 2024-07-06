//
//  PopularMoviesView.swift
//  TMDB
//
//  Created by Eslam on 07/07/2024.
//


import SwiftUI

struct PopularMoviesView: View {
    @ObservedObject var viewModel: MovieListViewModel

    var body: some View {
        TypeMovieView(viewModel: viewModel, typeTabMovie: TypeTabsMovie.Popular.rawValue)
    }
}
