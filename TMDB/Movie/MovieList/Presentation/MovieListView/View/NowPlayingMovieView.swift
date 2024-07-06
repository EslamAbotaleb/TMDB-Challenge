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
        NavigationView {
            LoadingView(isShowing: .constant(viewModel.isLoading), errorMessage: .constant(self.viewModel.errorMessage ?? "")) {
                VStack(alignment: .leading) {
                    if self.viewModel.isEmpty && self.viewModel.errorMessage == "" {
                        Text("No movies")
                    } else {
                        if self.viewModel.errorMessage == nil {
                            ContentNowPlayingView(viewModel: viewModel)
                        }
                    }
                }
            }
        }
    }
}

