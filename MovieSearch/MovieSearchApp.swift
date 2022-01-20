//
//  MovieSearchApp.swift
//  MovieSearch
//
//  Created by Ananth Jk on 19/01/2022.
//

import SwiftUI

@main
struct MovieSearchApp: App {
    var body: some Scene {
        WindowGroup {
            SearchView(viewModel: SearchViewModel())
        }
    }
}
