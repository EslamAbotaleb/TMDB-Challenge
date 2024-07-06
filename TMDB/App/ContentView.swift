//
//  ContentView.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(NetworkMonitor.self) private var networkMonitor
    @State private var selectedTabIndex = 1

    var body: some View {
        VStack {
            if networkMonitor.isConnected {
                NavigationStack {
                    TabView(selection: $selectedTabIndex,
                            content:  {
                        Text("Now Playing").tabItem { Text("Now Playing") }.tag(1)
                        Text("Popular").tabItem { Text("Popular") }.tag(2)
                        Text("Upcoming Movies").tabItem { Text("Upcoming Movies") }.tag(3)
                    })
                    .onChange(of: selectedTabIndex) {

                    }
                }
            } else {
                DisconnectConnectionView()
            }
        }
        .padding()
    }
}
#Preview {
    ContentView()
        .environment(NetworkMonitor())
}
