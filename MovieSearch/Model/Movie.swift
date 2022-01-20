//
//  Movie.swift
//  MovieSearch
//
//  Created by Ananth Jk on 19/01/2022.
//

import Foundation

struct Movie: Decodable, Identifiable {
    var id: String {
        imdbID
    }
    let title: String
    let year: String
    let imdbID: String
    let plot: String?
    let imdbRating: String?
    let genre: String?
    let type: String?
    let poster: String

    enum CodingKeys: String, CodingKey {
        case imdbID
        case imdbRating
        case title = "Title"
        case year = "Year"
        case plot = "Plot"
        case genre = "Genre"
        case poster = "Poster"
        case type = "Type"
    }
}

struct Search: Decodable {
    var movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}

extension Search {
    static func search(name: String) -> Request<Search> {
        Request(method: .get, path: nil, search: name)
    }
}
