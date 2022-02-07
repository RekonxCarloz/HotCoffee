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
    case small
    case medium
    case large
}

struct Order{
    let name: String
    let email: String
    let type: CoffeeTypes
    let size: CoffeeSize
}
