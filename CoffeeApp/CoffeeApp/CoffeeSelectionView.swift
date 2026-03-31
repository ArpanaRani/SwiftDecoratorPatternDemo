//
//  ContentView.swift
//  CoffeeApp
//
//  Created by Arpana Rani on 31/03/26.
//

import SwiftUI


struct CoffeeSelectionView: View {

    @StateObject private var viewModel = CoffeeViewModel()
    
//    init(viewModel: CoffeeViewModel) {
//        _viewModel = StateObject(wrappedValue: viewModel)
//    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {

                // Title
                HStack {
                    Image(systemName: "cup.and.saucer.fill")
                    Text("Select Your Coffee")
                        .font(.title)
                }
                
                // Coffee List
                
              //  ForEach(Array(viewModel.coffeeList.enumerated()), id: \.offset) { _, coffee in
                ForEach(viewModel.coffeeList, id: \.id) { coffee in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(coffee.name )
                            Text("₹\(coffee.getPrice())")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }

                        Spacer()

                        // Radio Button
                        Image(systemName: (viewModel.selectedCoffee?.id == coffee.id) ? "largecircle.fill.circle" : "circle")
                            .onTapGesture {
                                viewModel.selectedCoffee = coffee
                            }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                }

                Spacer()

                // Next Button
                NavigationLink(
                    destination: CoffeeCustomizationView(viewModel: viewModel)
                ) {
                    Text("Next →")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(viewModel.selectedCoffee == nil ? Color.gray : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(viewModel.selectedCoffee == nil)
            }
            .padding()
        }
    }
}

//#Preview {
//    CoffeeSelectionView(viewModel: CoffeeViewModel())
//}

