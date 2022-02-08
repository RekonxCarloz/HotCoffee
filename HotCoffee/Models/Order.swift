//
//  Order.swift
//  HotCoffee
//
//  Created by Carlos Cobian on 07/02/22.
//

import Foundation

enum CoffeeTypes: String, Codable{
    case cappuccino
    case latte
    case espressino
    case cortado
}

enum CoffeeSize: String, Codable{
    case Small
    case Medium
    case Large
}

struct Order: Codable{
    let name: String
    let coffeeName: CoffeeTypes
    let total: Double
    let size: CoffeeSize
}
