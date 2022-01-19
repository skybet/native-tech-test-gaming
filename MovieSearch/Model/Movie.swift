//
//  Movie.swift
//  MovieSearch
//
//  Created by Ananth Jk on 19/01/2022.
//

import Foundation

struct Movie: Decodable, Identifiable {
    var id: String {
        imdbRating
    }
    let title: String
    let year: String
    let imdbID: String
    let plot: String
    let imdbRating: String
    let genre: String

    enum CodingKeys: String, CodingKey {
        case imdbID
        case imdbRating
        case title = "Title"
        case year = "Year"
        case plot = "Plot"
        case genre = "Genre"
    }
}
