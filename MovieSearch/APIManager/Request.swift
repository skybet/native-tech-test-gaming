//
//  Request.swift
//  MovieSearch
//
//  Created by Ananth Jk on 19/01/2022.
//

import Foundation

enum Method: String {
    case get = "GET"
}

struct Request<Value> {
    
    var method: Method
    var search: String?
    var path: String?
    
    init(method: Method = .get, path: String?, search: String?) {
        self.method = method
        self.path = path
        self.search = search
    }
    
}
