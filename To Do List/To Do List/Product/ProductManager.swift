//
//  ProductManager.swift
//  To Do List
//
//  Created by Gabriel Fontenele on 06/01/26.
//

import Foundation

class ProductManager {
    static let shared = ProductManager()
    private init() {}
    
    private var products: [ToDoItem] = []
    
    func addProduct(_ product: ToDoItem) {
        products.append(product)
        sortProducts()
    }
    
    func getProducts() -> [ToDoItem] {
        return products
    }
    
    private func sortProducts() {
        //products.sort(by: $0.date < $1.date)}
    }
    
}
