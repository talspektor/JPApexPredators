//
//  Death.swift
//  BBQuotes17
//
//  Created by Tal talspektor on 18/09/2024.
//

import Foundation

struct Death: Decodable {
    let character: String
    let image: String
    let details: String
    let lastWords: String
    
    var imageURL: URL {
        URL(string: image)!
    }
}
