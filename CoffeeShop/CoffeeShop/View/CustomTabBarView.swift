//
//  CustomTabBarView.swift
//  CoffeeShop
//
//  Created by Bohdan Borysenko on 10.04.2025.
//

import Foundation
import SwiftUI

struct CustomTabBarView: View {
    @Binding var selectedTab: Int

    var body: some View {
        HStack {
            TabBarButton(icon: "house", index: 0, selectedTab: $selectedTab)
            TabBarButton(icon: "heart", index: 1, selectedTab: $selectedTab)
            TabBarButton(icon: "bag", index: 2, selectedTab: $selectedTab)
            TabBarButton(icon: "bell", index: 3, selectedTab: $selectedTab)
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 12)
        .background(
            Color.white
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(color: .black.opacity(0.08), radius: 8, y: -2)
        )
        .padding(.horizontal, 16)
        .padding(.bottom, 20)
    }
}
