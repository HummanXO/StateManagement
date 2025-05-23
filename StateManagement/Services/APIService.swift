//
//  APIService.swift
//  StateManagement
//
//  Created by Aleksandr on 15.05.2025.
//

import Foundation

struct APIService {
    var baseURL = "http://localhost:3000/posts"
    
    public func fetchData<T: Decodable>(completion: @escaping (Result<T, APIError>) -> Void) {
        guard
            let url = URL(string: baseURL)
        else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200
            else {
                completion(.failure(.invlidServerResponse))
                return
            }
            
            guard
                error == nil
            else {
                completion(.failure(.dataTaskError))
                return
            }
            
            guard
                let data = data
            else {
                completion(.failure(.dataError))
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedData))
                }
            }
            catch {
                completion(.failure(.errorDecode))
            }
            
        }.resume()
    }
    
}

enum APIError: Error {
    case invalidURL
    case invlidServerResponse
    case dataTaskError
    case dataError
    case errorDecode
}
