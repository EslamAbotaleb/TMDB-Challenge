//
//  MovieDetailsContentView.swift
//  TMDB
//
//  Created by Eslam on 07/07/2024.
//

import SwiftUI

struct MovieDetailsView: View {
    @ObservedObject var viewModel: MovieDetailsViewModel
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(self.viewModel.result?.overview ?? "")
                    .font(.headline)
                    .padding(8.0)
                Text("Run time: \(self.viewModel.result?.runtime ?? 0)")
                    .foregroundColor(.secondary)
                if let genres = viewModel.result?.genres, !genres.isEmpty {
                    VStack(alignment: .leading) {
                        Text("Genres:")
                            .font(.headline)
                            .padding(.top, 8.0)
                        ForEach(genres) { genre in
                            HStack {
                                if let name = genre.name {
                                    Text(name)
                                }
                                if let id = genre.id {
                                    Text("\(id)")
                                        .foregroundColor(.secondary)
                                }
                            }
                            .padding(.vertical, 2.0)
                        }
                    }
                    .padding(8.0)
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(8)
                    .shadow(radius: 4)
                } else {
                    Text("No genres available")
                        .foregroundColor(.secondary)
                }
            }
            .padding(8.0)
            .background(Color(UIColor.systemBackground))
            .cornerRadius(8)
            .shadow(radius: 4)
            .frame(maxWidth: .infinity)
        }
    }
}
