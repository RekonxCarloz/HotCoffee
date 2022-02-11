//
//  AddCoffeeOrderViewModel.swift
//  HotCoffee
//
//  Created by Carlos Cobian on 08/02/22.
//

import Foundation

struct AddCoffeeOrderViewModel{
    
    var name: String?
    var email: String?
    var selectedType: String?
    var selectedSize: String?
    
    var types: [String]{
        return CoffeeTypes.allCases.map{ $0.rawValue.capitalized}
    }
    
    var sizes: [String]{
        return CoffeeSize.allCases.map{ $0.rawValue.capitalized}
    }
    
}
