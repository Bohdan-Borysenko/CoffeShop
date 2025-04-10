//
//  ProductViewModel.swift
//  CoffeeShop
//
//  Created by Bohdan Borysenko on 10.04.2025.
//

import Foundation
import SwiftUI

class ProductViewModel: ObservableObject {
    @Published var selectedProducts: [Product] = []

    func addToSelection(_ product: Product) {
        if !selectedProducts.contains(product) {
            selectedProducts.append(product)
        }
    }

    func removeFromSelection(_ product: Product) {
        selectedProducts.removeAll { $0 == product }
    }
    
    var totalPrice: Double {
        selectedProducts.reduce(0) { $0 + $1.price }
    }

    func clearCart() {
        selectedProducts.removeAll()
    }
}
