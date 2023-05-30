//
//  APIManager.swift
//  MovieSearch
//
//  Created by Ananth Jk on 19/01/2022.
//

import Foundation

enum APIError: Error {
    case networkError
    case parsingError
}

final class APIManager {
    
    static let shared = APIManager()
    
    let apiKey = "a303f5f9"
    let host = "https://www.omdbapi.com/"
    
    private let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func execute<Value: Decodable>(_ request: Request<Value>, completion: @escaping (Result<Value, APIError>) -> Void) {
        urlSession.dataTask(with: urlRequest(for: request)) { responseData, response, _ in
            if let data = responseData {
                let response: Value
                do {
                    response = try JSONDecoder().decode(Value.self, from: data)
                } catch(let err) {
                    print(err)
                    completion(.failure(.parsingError))
                    return
                }
                
                completion(.success(response))
            } else {
                completion(.failure(.networkError))
            }
        }.resume()
    }
    
    private func urlRequest<Value>(for request: Request<Value>) -> URLRequest {
        let url = URL(host, apiKey, request)
        var result = URLRequest(url: url)
        result.httpMethod = request.method.rawValue
        return result
    }
    
}

extension URL {
    func url(with queryItems: [URLQueryItem]) -> URL {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)!
        components.queryItems = (components.queryItems ?? []) + queryItems
        return components.url!
    }
    
    init<Value>(_ host: String, _ apiKey: String, _ request: Request<Value>) {
        
        let queryItems = [ ("apikey", apiKey), (request.parameter?.rawValue ?? "s", request.parameterValue) ]
        .map { name, value in URLQueryItem(name: name, value: "\(value ?? "")") }
        
        let url = URL(string: host)!
            .appendingPathComponent(request.path ?? "")
            .url(with: queryItems)
        
        self.init(string: url.absoluteString)!
    }
}
