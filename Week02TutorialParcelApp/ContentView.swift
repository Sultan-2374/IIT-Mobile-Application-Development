//
//  ContentView.swift
//  Week02TutorialParcelApp
//
//  Created by Sultan  on 10/10/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var width: String = ""
    @State private var depth: String = ""
    
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Parcel Calculator")
                .font(.title)
                .padding()
            
            HStack(alignment: .center, spacing: 10) {
                Label("Weight (kg): ", systemImage: "")
                    .labelStyle(.titleOnly)
                    .frame(width: 120, alignment: .trailing)
                
                TextField("Enter weight", text: $weight)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border(Color.black, width: 2)
                    .keyboardType(.decimalPad)
            }
            HStack {
                
                Label("Height (cm): ", systemImage: "")
                    .labelStyle(.titleOnly)
                    .frame(width: 120, alignment: .trailing)
                
                TextField("Enter height", text: $height)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border(Color.black, width: 2)
                    .keyboardType(.decimalPad)
            }
            HStack {
                Label("Width (cm): ", systemImage: "")
                    .labelStyle(.titleOnly)
                    .frame(width: 120, alignment: .trailing)
                
                TextField("Enter width", text: $width)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border(Color.black, width: 2)
                    .keyboardType(.decimalPad)
            }
            HStack {
                Label("Depth (cm): ", systemImage: "")
                    .labelStyle(.titleOnly)
                    .frame(width: 120, alignment: .trailing)
                
                TextField("Enter depth", text: $depth)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border(Color.black, width: 2)
                    .keyboardType(.decimalPad)
            }
            
            Button("Calculate Cost") {
                print("Parcel Data:")
                print("Height: \(height)")
                print("Width: \(width)")
                print("Height: \(height)")
                print("Weight: \(weight)")
                
                if let weightValue = Double(weight),
                   let depthValue = Double(depth),
                   let widthValue = Double(width),
                   let heightValue = Double(height),
                   weightValue > 0, depthValue > 0, widthValue > 0, heightValue > 0 {
                    let volume = depthValue * widthValue * heightValue
                    var totalCost = 3.00
                    totalCost += (weightValue * 0.50)
                    totalCost += (volume / 1000) * 0.10
                    totalCost += max(totalCost, 4.00)
                    cost = String(format: "%.2f", totalCost)
                    print("")
                }
                    
                
            }
//                .buttonStyle(.borderedProminent)
            .buttonStyle(.glassProminent)
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

