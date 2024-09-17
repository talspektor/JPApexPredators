//
//  Predatores.swift
//  JPApexPredators17
//
//  Created by Tal talspektor on 17/09/2024.
//

import Foundation

class Predatores{
    var apevPredators: [ApexPredator] = []
    
    init() {
        decodeApexPradatorData()
    }
    
    func decodeApexPradatorData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                apevPredators = try decoder.decode([ApexPredator].self, from: data)
            } catch {
                print("Error decoding JSON data: \(error)")
            }
        }
    }
}
