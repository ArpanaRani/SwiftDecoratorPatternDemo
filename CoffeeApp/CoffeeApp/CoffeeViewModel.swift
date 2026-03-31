//
//  CoffeeViewModel.swift
//  CoffeeApp
//
//  Created by Arpana Rani on 31/03/26.
//

import Combine

class CoffeeViewModel: ObservableObject {

    // Coffee list for UI
    //hardcode to display for demo
    let coffeeList: [Coffee] = [
        Espresso(),
        Cappuccino(),
        Latte()
        ]
    
    // MARK: - Selected Base Coffee
    @Published var selectedCoffee: Coffee?

    // MARK: - Extras
    @Published var hasMilk: Bool = false
    @Published var hasSugar: Bool = false
    @Published var hasCream: Bool = false

    // MARK: - Final Coffee (Decorator applied)
    func getFinalCoffee() -> Coffee? {
        guard var coffee = selectedCoffee else { return nil }

        if hasMilk {
            coffee = MilkDecorator(coffee: coffee)
        }

        if hasSugar {
            coffee = SugarDecorator(coffee: coffee)
        }

        if hasCream {
            coffee = CreameDecorator(coffee: coffee)
        }

        return coffee
    }
}
