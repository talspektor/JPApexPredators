//
//  CurrencyTip.swift
//  LOTRConverter17
//
//  Created by Tal talspektor on 16/09/2024.
//

import Foundation
import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change Currency")
    
    var message: Text? = Text("You can tap the left or right currency to rring up the Selected Currency screen.")
    
}
