//
//  DisconnectConnection.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import SwiftUI

struct DisconnectConnectionView: View {
    var body: some View {
            VStack {
                Image(systemName: "wifi.slash")
                    .font(.title)
                    .foregroundStyle( .red)

                Text("Disconnected")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.red)
            }
        .padding()
    }
}
