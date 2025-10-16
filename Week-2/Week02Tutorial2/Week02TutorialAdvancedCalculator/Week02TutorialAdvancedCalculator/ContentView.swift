//
//  ContentView.swift
//  Week02TutorialAdvancedCalculator
//
//  Created by Sultan  on 16/10/2025.
//

import SwiftUI

struct ContentView: View {

    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var width: String = ""
    @State private var depth: String = ""
    @State private var cost: String = ""
    @State private var errorMessage: String? = nil
    @State private var useAdvancedPricing: Bool = false
    
    var isDisabled: Bool {
        weight.isEmpty || height.isEmpty || width.isEmpty || depth.isEmpty
    }

    var body: some View {
        VStack(spacing: 15) {
            Text("📦 Parcel Calculator")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            Toggle(isOn: $useAdvancedPricing) {
                Text("Use Advanced Pricing")
            }
            .padding(.horizontal)
            .toggleStyle(SwitchToggleStyle(tint: .green))
            
            HStack {
                Text("Weight (kg):").frame(width: 100, alignment: .trailing)
                TextField("Enter weight", text: $weight)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
            }
            
            HStack {
                Text("Height (cm):").frame(width: 100, alignment: .trailing)
                TextField("Enter height", text: $height)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
            }
            
            HStack {
                Text("Width (cm):").frame(width: 100, alignment: .trailing)
                TextField("Enter width", text: $width)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
            }
            
            HStack {
                Text("Depth (cm):").frame(width: 100, alignment: .trailing)
                TextField("Enter depth", text: $depth)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
            }
            
            Button("Calculate Cost") {
                calculateCost()
            }
            .disabled(isDisabled)
            .padding()
            .frame(maxWidth: .infinity)
            .background(isDisabled ? Color.gray : Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            } else if !cost.isEmpty {
                Text("Total cost is £\(cost)")
                    .fontWeight(.bold)
                    .padding()
            }
            Spacer()
        }
        .padding()
    }

    private func calculateCost() {
        
        // Clear previous results
        self.cost = ""
        self.errorMessage = nil
        
        // Convert inputs and perform initial validation
        guard let weightValue = Double(weight),
              let heightValue = Double(height),
              let widthValue = Double(width),
              let depthValue = Double(depth),
              weightValue > 0, heightValue > 0, widthValue > 0, depthValue > 0 else {
            errorMessage = "Error: Please enter valid positive numbers for all fields."
            return
        }
        
        let finalCost: Double
        
        // Check toggle state and route to the correct calculator
        if useAdvancedPricing {
            guard weightValue <= 30 else {
                errorMessage = "Error: Max weight is 30kg."
                return
            }
            guard heightValue <= 150, widthValue <= 150, depthValue <= 150 else {
                errorMessage = "Error: Max dimension is 150cm."
                return
            }
            
            finalCost = calculateAdvancedCost(weight: weightValue, height: heightValue, width: widthValue, depth: depthValue)
            
        } else {
            finalCost = calculateBasicCost(weight: weightValue, height: heightValue, width: widthValue, depth: depthValue)
        }
        
        self.cost = String(format: "%.2f", finalCost)
    }
    
    private func calculateBasicCost(weight: Double, height: Double, width: Double, depth: Double) -> Double {
        let volume = height * width * depth
        var totalCost = 3.00 // Base cost
        
        totalCost += weight * 0.50 // Weight charge
        totalCost += (volume / 1000) * 0.10 // Volume charge
        
        return max(totalCost, 4.00) // Ensure minimum charge
    }
    
    private func calculateAdvancedCost(weight: Double, height: Double, width: Double, depth: Double) -> Double {
        // Calculate Volume and Dimensional Weight
        let volumeCm3 = height * width * depth
        let volumeLitres = volumeCm3 / 1000
        let dimensionalWeight = volumeCm3 / 5000
        
        let chargeableWeight = max(weight, dimensionalWeight)
        
        // Base Cost Calculation
        var totalCost = 2.50 // Base cost
        totalCost += chargeableWeight * 1.50 // Chargeable weight cost
        totalCost += volumeLitres * 0.75 // Volume cost
        
        // Weight-based Surcharges (based on actual weight)
        if weight > 20 {
            totalCost *= 1.50
        } else if weight > 10 {
            totalCost *= 1.25
        }
        
        // Minimum Charge
        return max(totalCost, 5.00)
    }
}

#Preview {
    ContentView()
}
