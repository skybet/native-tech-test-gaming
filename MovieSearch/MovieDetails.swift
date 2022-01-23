//
//  MovieDetails.swift
//  MovieSearch
//
//  Created by Ananth Jk on 20/01/2022.
//

import SwiftUI

struct MovieDetails: View {
    @ObservedObject var viewModel: MovieDetailsViewModel
    var body: some View {
        if viewModel.movie == nil {
            ProgressView()
                .onAppear {
                    viewModel.getMovieDetails()
                }
                .navigationBarTitleDisplayMode(.inline)
        } else {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Spacer()
                        Image(uiImage: viewModel.movieImage ?? UIImage())
                            .resizable()
                            .frame(width: 200, height: 300, alignment: .center)
                            .scaledToFill()
                            .cornerRadius(10)
                        Spacer()
                    }
                    HStack {
                        HStack(alignment: .firstTextBaseline) {
                            Image(systemName: "star.fill")
                            Text(viewModel.movie?.imdbRating ?? "")
                        }
                        .padding(4)
                       // .padding(.horizontal, 2)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(5)
                        Text(viewModel.movie?.title ?? "")
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                    .padding(.top, 5)
                    Text(viewModel.movie?.genre ?? "")
                        .font(.footnote)
                    Text(viewModel.movie?.plot ?? "")
                        .font(.body)
                        .fontWeight(.thin)
                        .padding(.top, 10)
                }
                .padding()
                .onAppear {
                    viewModel.getImage()
                }
            .navigationBarTitleDisplayMode(.inline)
            }

        }
    }
}

struct MovieDetails_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetails(viewModel: MovieDetailsViewModel(id: "123"))
    }
}
/*
 Movie(title: "Guardians of the Galaxy Vol. 2", year: "2017", imdbID: "tt3896198", plot: "The Guardians struggle to keep together as a team while dealing with their personal family issues, notably Star-Lord's encounter with his father the ambitious celestial being Ego.", imdbRating: "7.6", genre: "Action, Adventure, Comedy", type: "Movie", poster: "https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_SX300.jpg")
 */
