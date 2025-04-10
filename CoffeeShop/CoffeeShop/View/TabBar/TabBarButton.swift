//
//  TabBarButton.swift
//  CoffeeShop
//
//  Created by Bohdan Borysenko on 10.04.2025.
//


import SwiftUI

struct TabBarButton: View {
    let icon: String
    let index: Int
    @Binding var selectedTab: Int

    var body: some View {
        Button(action: {
            selectedTab = index
        }) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 22))
                    .foregroundColor(selectedTab == index ? Color("ColorButton") : .gray)

                // Индикатор под активной иконкой
                Capsule()
                    .fill(selectedTab == index ? Color("ColorButton") : .clear)
                    .frame(width: 6, height: 4)
            }
            .frame(maxWidth: .infinity)
        }
    }
}