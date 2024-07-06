//
//  NowPlayingMovieView.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import SwiftUI

struct NowPlayingMovieView: View {
    @ObservedObject var viewModel: MovieListViewModel

    var body: some View {
        TypeMovieView(viewModel: viewModel, typeTabMovie: TypeTabsMovie.NowPlaying.rawValue)
    }
}

