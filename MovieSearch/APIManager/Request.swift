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
enum Parameters: String {
    case search = "s"
    case id = "i"
    case title = "t"
}

struct Request<Value> {
    
    var method: Method
    var parameterValue: String?
    var path: String?
    var parameter: Parameters?
    
    init(method: Method = .get, parameter: Parameters = .search, parameterValue: String?, path: String?) {
        self.method = method
        self.path = path
        self.parameter = parameter
        self.parameterValue = parameterValue
    }
    
}
