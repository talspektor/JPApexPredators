//
//  SelectCurrency.swift
//  LOTRConverter17
//
//  Created by Tal talspektor on 16/09/2024.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var topCurreny: Currency
    @Binding var bottomCurrency: Currency
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                
                Text("Select the currency you are starting with: \(Currency.silverPenny.rawValue)")
                    .fontWeight(.bold)
                
                IconGrid(selectedCurrency: $topCurreny)
                    
                Text("Select this currency you would like to convert to:")
                    .fontWeight(.bold)
                
                IconGrid(selectedCurrency: $bottomCurrency)
                
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
            
        }
    }
}

#Preview {
    SelectCurrency(topCurreny: .constant(.copperPenny), bottomCurrency: .constant(.goldPiece))
}
