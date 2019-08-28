//
//  CardManager.swift
//  Project15
//
//  Created by Alex Motor on 8/28/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import Foundation
import Alamofire

class CardManager {
    private let kAPIKey = "sJoVbrkZRPmshSXRb5TUbAyYEpMZp1I6ntujsnJvZskUFsFRkW"
    
    enum ManagerError: Error {
        case networkError(Error)
        case parsingError(Error)
        case notFound
    }
    
    private lazy var headers: HTTPHeaders = [
        "X-Mashape-Key" : kAPIKey
    ]
    
    static let shared = CardManager()
    
    private init() {}
    
    func loadCard(id: String, result: @escaping (Result<Card, ManagerError>) -> Void) {
        let url = "https://omgvamp-hearthstone-v1.p.mashape.com/cards/\(id)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        AF.request(url, headers: headers).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let cards = try JSONDecoder().decode([Card].self, from: data)
                    
                    guard let card = cards.first else {
                        result(.failure(.notFound))
                        return
                    }
                    result(.success(card))
                } catch {
                    result(.failure(.parsingError(error)))
                }

            case .failure(let error):
                result(.failure(.networkError(error)))
            }
        }
    }
    
    func loadCards(withNames names: [String], result: @escaping (Result<[Card], ManagerError>) -> Void) {
        var responsesLeft: Int = names.count
        var cards: [Card] = []
        var error: Error?
        
        let resultBlock: (Result<Card, ManagerError>) -> Void = { r in
            switch r {
            case .success(let card):
                cards.append(card)
            case .failure(let e):
                if error == nil {
                    error = e
                }
            }
            responsesLeft -= 1
            
            if responsesLeft == 0 {
                if let error = error {
                    result(.failure(.networkError(error)))
                } else {
                    result(.success(cards))
                }
            }
            print(responsesLeft)
        }
        
        for name in names {
            loadCard(id: name, result: resultBlock)
        }
    }
}
