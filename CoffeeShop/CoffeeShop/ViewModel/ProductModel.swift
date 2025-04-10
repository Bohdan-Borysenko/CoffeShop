//
//  ProductModel.swift
//  CoffeeShop
//
//  Created by Bohdan Borysenko on 10.04.2025.
//

import Foundation

struct Product: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let price: Double
    let imageName: String
    let category: String
}

let sampleProducts = [
    Product(name: "Cappuccino", price: 4.5, imageName: "Item1", category: "Cappuccino"),
    Product(name: "Espresso", price: 3.0, imageName: "Item2", category: "Espresso"),
    Product(name: "Latte", price: 4.0, imageName: "Item3", category: "Latte"),
    Product(name: "Flat White", price: 3.8, imageName: "Item4", category: "Flat White")
]
