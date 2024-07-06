//
//  ContentView.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = MovieListViewModel()
    @Environment(NetworkMonitor.self) private var networkMonitor
    @State private var selectedTabIndex = 1

    var body: some View {
        VStack {
            if networkMonitor.isConnected {
                NavigationStack {
                    TabView(selection: $selectedTabIndex,
                            content:  {
                        NowPlayingMovieView(viewModel: viewModel)
                            .tabItem { Text("Now Playing") }.tag(1)
                        PopularMoviesView(viewModel: viewModel)
                            .tabItem { Text("Popular") }.tag(2)
                        Text("Upcoming Movies").tabItem { Text("Upcoming Movies") }.tag(3)
                    })
                    .onChange(of: selectedTabIndex) {
                        viewModel.updateTabIndex(selectedTabIndex)
                    }
                }
            } else {
                DisconnectConnectionView()
            }
        }

    }
}
#Preview {
    ContentView()
        .environment(NetworkMonitor())
}
