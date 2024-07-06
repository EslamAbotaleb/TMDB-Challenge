//
//  TypeMoviesView.swift
//  TMDB
//
//  Created by Eslam on 07/07/2024.
//

import Foundation
import SwiftUI

struct TypeMovieView: View {
    @ObservedObject var viewModel: MovieListViewModel
    var typeTabMovie: String?

    var body: some View {
        NavigationView {
            LoadingView(isShowing: .constant(viewModel.isLoading), errorMessage: .constant(self.viewModel.errorMessage ?? "")) {
                VStack(alignment: .leading) {
                    if self.viewModel.isEmpty && self.viewModel.errorMessage == "" {
                        Text("No \(typeTabMovie ?? "") movies")
                    } else {
                        if self.viewModel.errorMessage == nil {
                            ContentMovieView(viewModel: viewModel)
                        }
                    }
                }
            }
        }
    }
}
