//
//  ProductCardView.swift
//  CoffeeShop
//
//  Created by Bohdan Borysenko on 10.04.2025.
//

import Foundation
import SwiftUI

struct ProductCardView: View {
    let product: Product
    @EnvironmentObject var productVM: ProductViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(product.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .cornerRadius(12)

            Text(product.name)
                .font(.headline)
                .foregroundColor(Color("ColorButton"))

            Text("$\(product.price, specifier: "%.2f")")
                .font(.subheadline)
                .foregroundColor(.gray)

            HStack {
                Spacer()
                Button(action: {
                    productVM.addToSelection(product)
                }) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(Color("ColorButton"))
                        .font(.title2)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}
