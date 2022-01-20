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
    
    func saveHistory() {
        if !history.isEmpty {
            historyStore = history[0...10].joined(separator: ",")
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
        }else {
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
                print(result.movies.first?.title)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
