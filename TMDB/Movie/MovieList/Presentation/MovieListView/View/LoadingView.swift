//
//  LoadingView.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import SwiftUI

struct LoadingView<Content>: View where Content: View {
    @Binding var isShowing: Bool
    @Binding var errorMessage: String

    var content: ()-> Content

    var body: some View {
        GeometryReader {
            geometry in
            ZStack(alignment: .center) {
                self.content()
                    .disabled(self.isShowing)
                    .blur(radius: self.isShowing ? 3 : 0)
                Text(errorMessage)
                    .frame(minWidth: 0,
                           maxWidth: .infinity,
                           minHeight: 0,
                           maxHeight: .infinity,
                           alignment: .center)
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                    .padding(16)
            }
        }
    }
}
