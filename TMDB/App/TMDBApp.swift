//
//  TMDBApp.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import SwiftUI

@main
struct TMDBApp: App {
    @State private var networkMonitor = NetworkMonitor()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(networkMonitor)
        }
    }
}
