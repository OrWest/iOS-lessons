//
//  DataSource.swift
//  Project13
//
//  Created by Alex Motor on 8/19/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import Foundation

class GirlDataSource {
    let girls: [Girl]
    
    init() {
        girls = GirlDataSource.fetchGirls()
    }
    
    private static func fetchGirls() -> [Girl] {
        guard let url = Bundle.main.url(forResource: "places", withExtension: "plist"),
            let data = try? Data(contentsOf: url) else {
            return []
        }
        
        return (try? PropertyListDecoder().decode([Girl].self, from: data)) ?? []
    }
}
