//
//  ContentNowPlayingView.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import SwiftUI

struct ContentMovieView: View {
    @ObservedObject var viewModel: MovieListViewModel
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.results) { movie in
                    HStack(alignment: .top) {
                        AsyncImage(url: URL(string: "\(PosterPathMovieUrlImage.baseImageUrl)\(movie.posterPath)")!) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        } placeholder: {
                            ProgressView()
                                .frame(width: 100, height: 50)
                        }
                        VStack(alignment: .leading, spacing: 8) {
                            Text(movie.title)
                                .foregroundColor(.black)
                                .font(.headline)
                            Spacer()
                            Text(movie.releaseDate)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding(.leading, 8)
                        Spacer()
                    }
                    .padding()
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(8)
                    .shadow(radius: 4)
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(8.0)
        }
    }
}
