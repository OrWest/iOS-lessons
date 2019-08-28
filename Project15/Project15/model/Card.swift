import Foundation
import Alamofire

struct Card: Decodable {
    let title: String
    let text: String
    let imageURL: URL
    let imageGoldURL: URL
    
    enum CodingKeys: String, CodingKey {
        case title = "name"
        case text
        case imageURL = "img"
        case imageGoldURL = "imgGold"
    }
}

