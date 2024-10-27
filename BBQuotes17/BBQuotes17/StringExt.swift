//
//  StringExt.swift
//  BBQuotes17
//
//  Created by Tal talspektor on 10/25/24.
//

import Foundation

extension String {
    func removeSpaces() -> String {
        replacingOccurrences(of: " ", with: "")
    }
    
    func removeCaseAndSpace() -> String {
        removeSpaces().lowercased()
    }
}
