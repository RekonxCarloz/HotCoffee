//
//  OrdersTableViewController.swift
//  HotCoffee
//
//  Created by Carlos Cobian on 07/02/22.
//

import Foundation
import UIKit

class OrderTableViewController: UITableViewController{
    override func viewDidLoad(){
        super.viewDidLoad()
        fetchOrders()
    }
    
    private func fetchOrders(){
        guard let coffeOrderingURL = URL(string: "https://island-bramble.glitch.me/orders") else{
            fatalError("URL Not working.")
        }
        let resource = Resource<[Order]>(url: coffeOrderingURL)
        WebService().load(resource: resource){ result in
            switch result{
            case .success(let orders):
                print(orders)
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
}
