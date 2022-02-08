//
//  OrderViewModel.swift
//  HotCoffee
//
//  Created by Carlos Cobian on 07/02/22.
//

import Foundation

class OrderListViewModel{
    var ordersViewModel: [OrderViewModel]
    
    init(){
        self.ordersViewModel = [OrderViewModel]()
    }
}

extension OrderListViewModel{
    func orderAtRow(at index: Int)->OrderViewModel{
        return self.ordersViewModel[index]
    }
}


struct OrderViewModel{
    let order: Order
}

extension OrderViewModel{
    var name: String{
        return self.order.name
    }
    var coffeeName: String{
        return self.order.coffeeName.rawValue.capitalized
    }
    var total: Double{
        return self.order.total
    }
    var size: String{
        return self.order.size.rawValue.capitalized
    }
}
