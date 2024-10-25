//
//  PredatorMap.swift
//  JPApexPredators17
//
//  Created by Tal talspektor on 17/09/2024.
//

import SwiftUI
import MapKit

struct PredatorMap: View {
    let predators = Predators()
    
    @State var position: MapCameraPosition
    @State var satellite = false
    @State var selectedPredator: ApexPredator?
    
    var body: some View {
        Map(position: $position) {
            ForEach(predators.apevPredators) { predator in
                Annotation(predator.name, coordinate: predator.location) {
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .shadow(color: .white, radius: 3)
                        .scaleEffect(x: -1)
                        .onTapGesture {
                            selectedPredator = predator // Update the selected predator
                        }
                    
                    if selectedPredator?.id == predator.id {
                        infoCard(for: predator)
                            .transition(.move(edge: .bottom))
                    }
                }
            }
        }
        .mapStyle(satellite ? .imagery(elevation: .realistic) : .standard(elevation: .realistic))
        .overlay(alignment: .bottomTrailing) {
            Button {
                satellite.toggle()
            } label: {
                Image(systemName: satellite ? "globe.americas.fill" : "globe.americas")
                    .font(.largeTitle)
                    .imageScale(.large)
                    .padding(3)
                    .background(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 7))
                    .shadow(radius: 3)
                    .padding()
            }
        }
        .toolbarBackground(.automatic)
    }
    
    // Define the info card view
        private func infoCard(for predator: ApexPredator) -> some View {
            VStack(alignment: .leading) {
                Text(predator.name)
                    .font(.headline)
                    .padding()
                
                Text("Location: \(predator.location.latitude), \(predator.location.longitude)")
                    .font(.subheadline)
                    .padding(.horizontal)
                
                Button("Close") {
                    selectedPredator = nil // Deselect the predator
                }
                .padding()
            }
            .background(Color.blue.opacity(0.5))
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding()
            .onTapGesture {
                selectedPredator = nil
            }
        }
}

#Preview {
    PredatorMap(position: .camera(
        .init(
            centerCoordinate: Predators().allApexPredators[2].location,
            distance: 1000,
            heading: 250,
            pitch: 80
        )
    ))
    .preferredColorScheme(.dark)
}
