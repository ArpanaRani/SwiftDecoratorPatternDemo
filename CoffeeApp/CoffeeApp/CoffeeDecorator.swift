//
//  CoffeeDecorator.swift
//  CoffeeApp
//
//  Created by Arpana Rani on 31/03/26.
//

import Foundation
class CoffeeDecorator : Coffee {
    var id: UUID
    private var coffee: Coffee

    
    init(coffee: Coffee) {
        self.coffee = coffee
        self.id = coffee.id
    }
    var name: String {
        return coffee.name
    }
    func getPrice() -> Double {
        
        return  self.coffee.getPrice()
    }
    func getIngredients() -> String {
        return coffee.getIngredients()
    }

}

class MilkDecorator:  CoffeeDecorator {

   override func getPrice() -> Double {
        super.getPrice() + 100
    }
    
    override func getIngredients() -> String {
        return super.getIngredients()+" Milk"
    }
}

class SugarDecorator: CoffeeDecorator {


    override func getPrice() -> Double {
        return super.getPrice() + 50
    }
    override func getIngredients() -> String {
        return super.getIngredients() + " Sugar"
    }
}
class CreameDecorator: CoffeeDecorator {

    override func getPrice() -> Double {
        return super.getPrice() + 70.6
    }
    
    override func getIngredients() -> String {
        return super.getIngredients() + " Cream"
    }
}
