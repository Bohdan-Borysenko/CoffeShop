//
//  DetailItemView.swift
//  CoffeeShop
//
//  Created by Bohdan Borysenko on 09.04.2025.
//

import Foundation
import SwiftUI

struct DetailItemView: View {
    @Binding var showTabBar: Bool
    let product: Product
    @EnvironmentObject var productVM: ProductViewModel
    @State private var selectedProduct: Product? = nil
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 24) {

            // MARK: - Top Bar
            ZStack {
                Text("Detail")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)

                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .frame(width: 32, height: 32)
                            .background(Color("ColorButton"))
                            .clipShape(Circle())
                    }

                    Spacer()

                    Image(systemName: "suit.heart")
                        .foregroundColor(Color("ColorButton"))
                }
            }
            .padding(.horizontal)
            .padding(.top, 10)

            // MARK: - Product Image
            Image(product.imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(16)
                .frame(height: 260)
            
            Text(product.name)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Spacer()
            // MARK: - Product Info
            VStack(spacing: 8) {
                HStack {
                    VStack {
                        Text("Price:")

                        Text(String(format: "$%.2f", product.price))
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 60)
                    
                    Button(action: {
                        productVM.addToSelection(product)
                    }) {
                        Text("Add to Cart")
                            .font(.headline)
                            .frame(minWidth: 40, maxWidth: 150)
                            .padding()
                            .background(Color("ColorButton"))
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }
                
            }


            // MARK: - Add to Cart Button
            .padding(.bottom, 24)
        }
        .padding(.horizontal)
        .onAppear {
            showTabBar = false
        }
        .onDisappear {
            showTabBar = true
        }
    }
}

#Preview {
    DetailItemView(
        showTabBar: .constant(true),
        product: sampleProducts[0],
    )
    .environmentObject(ProductViewModel())
}
