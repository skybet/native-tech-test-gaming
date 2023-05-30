//
//  APITest.swift
//  MovieSearchTests
//
//  Created by Ananth Jk on 19/01/2022.
//

import XCTest
@testable import MovieSearch

class APITest: XCTestCase {

    func test_url_queryParams() {
        let queryItem = URLQueryItem(name: "testName", value: "testValue")
        let url = URL(string: "http://www.omdbapi.com")!.url(with: [queryItem])
        XCTAssertEqual(url.absoluteString, "http://www.omdbapi.com?testName=testValue")
    }
    
    func test_full_url_builder() {
        let searchRequest: Request<Search> = Request(method: .get, parameter: .search, parameterValue: "aven", path: nil)
        let searchUrl = URL("http://www.omdbapi.com", "testKey", searchRequest)
        XCTAssertEqual(searchUrl.absoluteString, "http://www.omdbapi.com/?apikey=testKey&s=aven")
        
        let movieRequest: Request<Movie> = Request(method: .get, parameter: .id, parameterValue: "12345", path: nil)
        let movieUrl = URL("http://www.omdbapi.com", "testKey", movieRequest)
        XCTAssertEqual(movieUrl.absoluteString, "http://www.omdbapi.com/?apikey=testKey&i=12345")
        
        let titleRequest: Request<Movie> = Request(method: .get, parameter: .title, parameterValue: "avengers", path: nil)
        let titleUrl = URL("http://www.omdbapi.com", "testKey", titleRequest)
        XCTAssertEqual(titleUrl.absoluteString, "http://www.omdbapi.com/?apikey=testKey&t=avengers")
    }

}
