//
//  CoffeeProtocol.swift
//  CoffeeApp
//
//  Created by Arpana Rani on 31/03/26.
//
import Foundation
protocol Coffee :Identifiable {
    var id: UUID { get }
    var name: String { get }
    func getPrice() -> Double
    func getIngredients() -> String
}

// Now I have three coffe type with basic requirement
struct Espresso : Coffee {
    
    let id = UUID()
    var name: String = "Espresso"
    
    func getPrice() -> Double {
        return 120.00
    }
    func getIngredients() -> String {
        return "Espresso coffee with"
    }

}

struct Cappuccino : Coffee {
    
    let id = UUID()
    
    var name: String = "Cappuccino"
    
    func getIngredients() -> String {
        return "Cappuccino coffee with"
    }
    
    func getPrice() -> Double {
        return 210.00
    }
 
}
struct Latte : Coffee {
    
    let id = UUID()
    
    var name: String = "Latte"
    
    func getIngredients() -> String {
        return "Latte coffee with "
    }
    func getPrice() -> Double {
        return 220.00
    }

}
