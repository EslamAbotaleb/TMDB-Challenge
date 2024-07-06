//
//  ContentView.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(NetworkMonitor.self) private var networkMonitor

    var body: some View {
        VStack {
            if networkMonitor.isConnected {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
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
