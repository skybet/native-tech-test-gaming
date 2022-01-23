//
//  MovieDetailsViewModel.swift
//  MovieSearch
//
//  Created by Ananth Jk on 23/01/2022.
//

import SwiftUI

class MovieDetailsViewModel: ObservableObject {
    @Published var movie: Movie?
    @Published var movieImage: UIImage?
    var movieID: String
    
    init(id movieID: String) {
        self.movieID = movieID
    }
    
    func getMovieDetails() {
        APIManager.shared.execute(Movie.getMovieDetails(for: movieID)) { result in
            switch result {
            case .success(let movie):
                DispatchQueue.main.async {
                    self.movie = movie
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getImage() {
        if let movie = movie {
            Movie.getImage(for: movie) { image in
                DispatchQueue.main.async {
                    self.movieImage = image
                }
            }
        }
        
    }
}
