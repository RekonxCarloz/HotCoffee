//
//  OrdersTableViewController.swift
//  HotCoffee
//
//  Created by Carlos Cobian on 07/02/22.
//

import Foundation
import UIKit

class OrderTableViewController: UITableViewController{
    private var orderListVM = OrderListViewModel()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        fetchOrders()
    }
    
    private func fetchOrders(){
        guard let coffeOrderingURL = URL(string: "https://island-bramble.glitch.me/orders") else{
            fatalError("URL Not working.")
        }
        let resource = Resource<[Order]>(url: coffeOrderingURL)
        WebService().load(resource: resource){[weak self] result in
            switch result{
            case .success(let orders):
                self?.orderListVM.ordersViewModel = orders.map(OrderViewModel.init)
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderListVM.ordersViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vm = orderListVM.orderAtRow(at: indexPath.row)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell") else{
            fatalError("Cell not found.")
        }
        
        cell.textLabel?.text = vm.coffeeName
        cell.detailTextLabel?.text = vm.size
        
                
        return cell
    }
}
