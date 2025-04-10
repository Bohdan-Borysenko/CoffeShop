//
//  CartView.swift
//  CoffeeShop
//
//  Created by Bohdan Borysenko on 10.04.2025.
//

import Foundation
import SwiftUI

struct CartView: View {
    @Binding var showTabBar: Bool
    @EnvironmentObject var productVM: ProductViewModel
    @Binding var selectedTab: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {

            // Верхняя панель
            HStack {
                Button(action: {
                    selectedTab = 0
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        .frame(width: 32, height: 32)
                        .background(Color("ColorButton"))
                        .clipShape(Circle())
                }

                Spacer()

                Text("Your Cart")
                    .font(.title)
                    .fontWeight(.bold)

                Spacer()

                Color.clear.frame(width: 32, height: 32)
            }
            .padding(.top)

            if productVM.selectedProducts.isEmpty {
                Spacer()
                VStack(spacing: 16) {
                    Image(systemName: "cart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.gray.opacity(0.3))

                    Text("Your cart is empty")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                .frame(maxWidth: .infinity)
                Spacer()
            } else {
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(productVM.selectedProducts) { product in
                            HStack(spacing: 16) {
                                Image(product.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 70, height: 70)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))

                                VStack(alignment: .leading, spacing: 4) {
                                    Text(product.name)
                                        .font(.headline)
                                    Text(String(format: "$%.2f", product.price))
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }

                                Spacer()

                                Button(action: {
                                    productVM.removeFromSelection(product)
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }

                VStack(spacing: 16) {
                    HStack {
                        Text("Total")
                            .font(.title2)
                        Spacer()
                        Text(String(format: "$%.2f", productVM.totalPrice))
                            .font(.title2)
                            .bold()
                    }

                    Button(action: {
                        productVM.clearCart()
                        selectedTab = 3 // Переход к DeliveryView
                    }) {
                        Text("Checkout")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("ColorButton"))
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.05))
                .cornerRadius(16)
            }
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
    CartView(showTabBar: .constant(true), selectedTab: .constant(0))
        .environmentObject(ProductViewModel())
}
