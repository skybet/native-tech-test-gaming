//
//  MovieView.swift
//  MovieSearch
//
//  Created by Ananth Jk on 19/01/2022.
//

import SwiftUI

struct MovieList: View {
  @State var movies: [Movie]
    var title: String
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
            ForEach($movies) { movie in
                    MovieView(movie: movie)
                Divider()
                    .padding(.horizontal)
                }
            }
        }
        .navigationTitle(title)
    }
}

struct MovieView: View {
    @Binding var movie: Movie
    @State var image = UIImage()
    var body: some View {
        HStack(alignment: .top) {
            Image(uiImage: image)
                .resizable()
                .frame(width: 60, height: 100)
                .aspectRatio(contentMode: .fill)
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.title2)
                HStack {
                    Text(movie.year)
                    Text(movie.type ?? "")
                }
                .font(.body)
            }
            Spacer()
        }
        .padding()
        .onAppear {
            getImage()
        }
    }
    func getImage() {
        let imageURL = URL(string: movie.poster)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageURL!)
            DispatchQueue.main.async {
                guard let data = data else { return }
                self.image = UIImage(data: data) ?? UIImage(systemName: "photo")!
            }
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(movie: .constant(Movie(title: "Guardians of the Galaxy Vol. 2", year: "2017", imdbID: "tt3896198", plot: "The Guardians struggle to keep together as a team while dealing with their personal family issues, notably Star-Lord's encounter with his father the ambitious celestial being Ego.", imdbRating: "7.6", genre: "Action, Adventure, Comedy", type: "Movie", poster: "https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_SX300.jpg")))
    }
}
