//
//  ContentView.swift
//  JPApexPredators17
//
//  Created by Tal talspektor on 16/09/2024.
//

import SwiftUI
import MapKit

struct ContentView: View {
    let predators = Predators()
    @State var searchText = ""
    @State var alphabetical = false
    @State var currentSelection = PredatorType.all
    
    var fillteredDinos: [ApexPredator] {
        predators.fiilter(by: currentSelection)
        
        predators.sort(by: alphabetical)
        return predators.search(for: searchText)
    }
    
    var body: some View {
        NavigationStack {
            List(fillteredDinos) { predator in
                NavigationLink {
                    PredatorDetail(
                        predator: predator, position: .camera(
                            .init(centerCoordinate: predator.location, distance: 30000)
                        )
                    )
                } label: {
                    HStack {
                        // Dinasaur image
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .shadow(color: .white, radius: 1)
                        
                        VStack(alignment: .leading) {
                            Text(predator.name)
                                .fontWeight(.bold)
                            
                            Text(predator.type.rawValue.capitalized)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 13)
                                .padding(.vertical, 5)
                                .background(predator.type.background)
                                .clipShape(.capsule)
                        }
                    }
                }
            }
            .navigationTitle("Apex Predatores")
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.default, value: searchText)
            .animation(.default, value: alphabetical)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        alphabetical.toggle()
                    } label: {
                        Image(systemName: alphabetical ? "film" : "textformat")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Picker("Filter", selection: $currentSelection.animation()) {
                            ForEach(PredatorType.allCases) { type in
                                Label(type.rawValue.capitalized, systemImage: type.icon)
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
