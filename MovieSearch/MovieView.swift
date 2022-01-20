//
//  MovieView.swift
//  MovieSearch
//
//  Created by Ananth Jk on 19/01/2022.
//

import SwiftUI

struct MovieView: View {
    @Binding var movie: Movie
    var body: some View {
        Text(movie.title)
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(movie: .constant(Movie(title: "Guardians of the Galaxy Vol. 2", year: "2017", imdbID: "tt3896198", plot: "The Guardians struggle to keep together as a team while dealing with their personal family issues, notably Star-Lord's encounter with his father the ambitious celestial being Ego.", imdbRating: "7.6", genre: "Action, Adventure, Comedy", poster: "https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_SX300.jpg")))
    }
}
