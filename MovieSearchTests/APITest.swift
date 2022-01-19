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

}
