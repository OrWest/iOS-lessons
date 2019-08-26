//
//  NetworkManager.swift
//  Project14
//
//  Created by Alex Motor on 8/26/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import Foundation

class NetworkManager {
    enum NetworkError: Error {
        case error(Error)
        case cannotConvertDataToText
        case unknown
    }
    
    private let baseURL = URL(string: "https://jsonplaceholder.typicode.com")!
    static let shared = NetworkManager()
    
    private let session: URLSession
    
    private init() {
        let config = URLSessionConfiguration.default
        session = URLSession(configuration: config)
    }
    
    func requestToDos(id: String, completion: @escaping (Result<String, NetworkError>) -> Void) {
        let request = URLRequest(url: baseURL.appendingPathComponent("todos/\(id)"))
        
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(.error(error)))
                } else {
                    completion(.failure(.unknown))
                }
                return
            }
            
            guard let text = String(data: data, encoding: .utf8) else {
                completion(.failure(.cannotConvertDataToText))
                return
            }
            
            completion(.success(text))
        }
        task.resume()
    }
    
    func loadImage(completion: @escaping (Result<URL, NetworkError>) -> Void) {
        let task = session.downloadTask(with: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Apple_Logo.svg/300px-Apple_Logo.svg.png")!) { url, _, error in
            
            DispatchQueue.main.async {
                guard let url = url else {
                    if let error = error {
                        completion(.failure(.error(error)))
                    } else {
                        completion(.failure(.unknown))
                    }
                    return
                }
                
                completion(.success(url))
            }
        }
        
        task.resume()
        
        task.cancel()
    }
}
