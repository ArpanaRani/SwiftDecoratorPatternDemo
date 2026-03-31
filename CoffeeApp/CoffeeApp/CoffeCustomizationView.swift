//
//  CoffeCustomizationView.swift
//  CoffeeApp
//
//  Created by Arpana Rani on 31/03/26.
//
import SwiftUI

struct CoffeeCustomizationView: View {

    @ObservedObject var viewModel: CoffeeViewModel

    var body: some View {
        NavigationStack {
            
            VStack(spacing: 25) {
                
                // Base coffee
                if let coffee = viewModel.selectedCoffee {
                    Text("Base: \(coffee.name)")
                        .font(.headline)
                }
                
                Divider()
                
                // Toggles
                Toggle("Milk ", isOn: $viewModel.hasMilk)
                Toggle("Sugar", isOn: $viewModel.hasSugar)
                Toggle("Cream" , isOn: $viewModel.hasCream)
                
                Divider()
                
                // Live preview
                if let coffee = viewModel.getFinalCoffee() {
                    let isAnyDecoratorOn = viewModel.hasMilk || viewModel.hasSugar || viewModel.hasCream
                    
                    VStack(spacing: 10) {
                        
                        if isAnyDecoratorOn {
                            
                            Text(coffee.getIngredients())
                                .font(.headline)
                        } else{
                            Text(coffee.name)
                                .font(.title3)
                        }
                        
                        Text("₹\(coffee.getPrice())")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.green)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                }
                
                Spacer()
            }
            .navigationTitle("Customize Your Coffee")
        }
        .padding()
    }
}

