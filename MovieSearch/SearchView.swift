//
//  ContentView.swift
//  MovieSearch
//
//  Created by Ananth Jk on 19/01/2022.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .center) {
                    TextField("Enter Movie Name", text: $viewModel.searchParamater)
                        .textFieldStyle(.roundedBorder)
                    Button {
                        if !viewModel.searchParamater.isEmpty {
                            viewModel.search()
                        }
                    } label: {
                        HStack {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                    }
                    .buttonStyle(.bordered)
                }
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(viewModel.history, id: \.self) { value in
                            Button {
                                viewModel.search()
                            } label: {
                                Text(value)
                            }
                            .buttonStyle(.borderedProminent)
                        }
                    }
                NavigationLink(isActive: $viewModel.showResult) {
                    MovieList(movies: viewModel.movies)
                } label: {
                    Text("")
                }

            }
            .onAppear {
                viewModel.getHistory()
        }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel())
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}

extension String {
    var array: [String] {
        if !self.isEmpty {
            return self.components(separatedBy: ",")
        }else {
            return []
        }
    }
}
extension Array where Element == String {
    var string: String {
        self.joined(separator: ",")
    }
}
