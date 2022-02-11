//
//  Order.swift
//  HotCoffee
//
//  Created by Carlos Cobian on 07/02/22.
//

import Foundation

enum CoffeeTypes: String, Codable, CaseIterable{
    case cappuccino
    case latte
    case espressino
    case cortado
    case americano
    case frapuccino
    case moca
}

enum CoffeeSize: String, Codable, CaseIterable{
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

extension Order{
    
    static var all: Resource<[Order]> = {
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else{
            fatalError("URL is incorrect!")}
        
        return Resource<[Order]>(url: url)
    }()
    
    static func createOrder(vm: AddCoffeeOrderViewModel)->Resource<Order?>{
        let order = Order(vm)
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else{
            fatalError("URL is incorrect!")}
        guard let encodeData = try? JSONEncoder().encode(order) else {
            fatalError("Error encoding data!")
        }
        
        var resource = Resource<Order?>(url: url)
        resource.body = encodeData
        resource.httpMethod = HttpMethod.post
    
        return resource
    }
}

extension Order{
    init?(_ vm: AddCoffeeOrderViewModel){
        
        guard let name = vm.name,
              let selectedType = CoffeeTypes(rawValue: vm.selectedType!.lowercased()),
        let selectedSize = CoffeeSize(rawValue: vm.selectedSize!.lowercased()) else {
            return nil
        }
        self.name = name
        self.coffeeName = selectedType
        self.size = selectedSize
        self.total = 0
    }
}
