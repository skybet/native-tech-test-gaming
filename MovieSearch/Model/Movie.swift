//
//  Movie.swift
//  MovieSearch
//
//  Created by Ananth Jk on 19/01/2022.
//

import Foundation
import UIKit

struct Movie: Decodable, Identifiable {
    var id: String {
        imdbID
    }
    let title: String
    let year: String
    var imdbID: String
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
extension Movie {
    static func getMovieDetails(for id: String) -> Request<Movie> {
        Request(method: .get, parameter: .id, parameterValue: id, path: nil)
    }
    static func getImage(for movie: Movie, completion: @escaping (_ image: UIImage) -> Void) {
        let imageURL = URL(string: movie.poster)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageURL!)
            DispatchQueue.main.async {
                guard let data = data else { return }
                completion(UIImage(data: data) ?? UIImage(systemName: "photo")!)
            }
        }
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
        Request(parameterValue: name, path: nil)
    }
}
