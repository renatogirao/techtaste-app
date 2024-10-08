//
//  NetworkingManager.swift
//  TechTaste
//
//  Created by Renato Savoia Girão on 26/09/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case decodingError
}

class NetworkingManager {
    func getProductsList(completion: @escaping ((Result<[Product], Error>) -> Void)) {
        guard let url = URL(string: "https://my-json-server.typicode.com/alura-cursos/techtaste-api/products") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            
            guard let data else {
                completion(.failure(NetworkError.invalidData))
                return
            }
            
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(products))
            } catch {
                completion(.failure(NetworkError.decodingError))
            }
        }
        
        task.resume()
    }
}
