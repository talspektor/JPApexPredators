//
//  Predatores.swift
//  JPApexPredators17
//
//  Created by Tal talspektor on 17/09/2024.
//

import Foundation

class Predators {
    var allApexPredators: [ApexPredator] = []
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
                allApexPredators = try decoder.decode([ApexPredator].self, from: data)
                apevPredators = allApexPredators
            } catch {
                print("Error decoding JSON data: \(error)")
            }
        }
    }
    
    func search(for searchTerm: String) -> [ApexPredator] {
        if searchTerm.isEmpty {
            return apevPredators
        } else {
            return apevPredators.filter { predator in
                predator.name.localizedCaseInsensitiveContains(searchTerm)
            }
        }
    }
    
    func sort(by alphbetical: Bool) {
        apevPredators.sort { predator1, predator2 in
            if alphbetical {
                predator1.image < predator2.image
            } else {
                predator1.id < predator2.id
            }
        }
    }
    
    func fiilter(by type: PredatorType) {
        if type != .all {
            apevPredators = allApexPredators.filter { predator in
                predator.type == type
            }
        } else {
            apevPredators = allApexPredators
        }
    }
}
