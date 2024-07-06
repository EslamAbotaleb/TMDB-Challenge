//
//  LazyView.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import SwiftUI

//MARK: - LazyView for execute content once there action happened from user
struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}
