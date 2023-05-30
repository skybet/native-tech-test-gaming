//
//  SearchViewModel.swift
//  MovieSearch
//
//  Created by Ananth Jk on 19/01/2022.
//

import Foundation
import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var searchParamater: String = ""
    @Published var history: [String] = []
    @AppStorage("history") var historyStore: String = ""
    @Published var movies: [Movie] = []
    @Published var showResult = false
    @Published var error = false
    
    func saveHistory() {
        if !history.isEmpty {
            historyStore = history[0...(min(10, history.count - 1))].joined(separator: ",")
        }
    }
    
    func getHistory() {
        history = historyStore.array
    }
    
    func search() {
        updateHistory()
        getMovies()
    }
    
    private func updateHistory() {
        if history.isEmpty {
            history.append(searchParamater)
        }else if !history.contains(searchParamater) {
            history.insert(searchParamater, at: 0)
            if history.count > 9 {
                history.popLast()
            }
        }
    }
    
    private func getMovies() {
        APIManager.shared.execute(Search.search(name: searchParamater)) { result in
            switch result {
            case .success(let result):
                DispatchQueue.main.async {
                    self.movies = result.movies.sorted { $0.year > $1.year }
                    self.showResult = true
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.error = true
                }
            }
        }
    }
    
}
