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
    @State private var cost: String = ""
    
    var isDisabled: Bool {
        weight.isEmpty || height.isEmpty || width.isEmpty || depth.isEmpty
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text("📦 Parcel Calculator")
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
                calculateCost()
            }
            .disabled(isDisabled)
            .padding()
            .background(isDisabled ? Color.gray : Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            if !cost.isEmpty {
                if let costValue = Double(cost), costValue > 0.00 {
                    Text("Total cost is £\(cost)")
                } else {
                    Text(cost)
                        .foregroundColor(.red)
                }
            }
            
            Spacer()
        }
        .padding()
    }
    
    private func calculateCost() {
            // 1. Validate inputs
            guard let weightValue = Double(weight),
                  let depthValue = Double(depth),
                  let widthValue = Double(width),
                  let heightValue = Double(height),
                  weightValue > 0, depthValue > 0, widthValue > 0, heightValue > 0 else {
                cost = "Error: Please enter valid positive numbers"
                return
            }
            
            // 2. Perform calculations
            let volume = depthValue * widthValue * heightValue
            var totalCost = 3.00 // Base cost [cite: 137]
            
            // Weight charge
            totalCost += weightValue * 0.50
            
            // Volume charge (convert cm³ to litres)
            totalCost += (volume / 1000) * 0.10
            
            // Ensure minimum charge
            totalCost = max(totalCost, 4.00)
            
            cost = String(format: "%.2f", totalCost)
        }
    }

#Preview {
    ContentView()
}

