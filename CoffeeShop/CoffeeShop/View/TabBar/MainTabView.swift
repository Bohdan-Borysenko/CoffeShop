//
//  TabView.swift
//  CoffeeShop
//
//  Created by Bohdan Borysenko on 09.04.2025.
//

import Foundation
import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    @State private var showTabBar = true
    @StateObject var productVM = ProductViewModel()

    var body: some View {
        ZStack {
            currentView()
                .environmentObject(productVM)

            if showTabBar {
                VStack {
                    Spacer()
                    CustomTabBarView(selectedTab: $selectedTab)
                }
            }
        }
    }

    @ViewBuilder
    private func currentView() -> some View {
        switch selectedTab {
        case 0:
            HomeView(showTabBar: $showTabBar, selectedTab: $selectedTab)
        case 1:
            CartView(showTabBar: $showTabBar, selectedTab: $selectedTab)
        case 2:
            CartView(showTabBar: $showTabBar, selectedTab: $selectedTab) 
        case 3:
            DeliveryView(showTabBar: $showTabBar, selectedTab: $selectedTab)
        default:
            HomeView(showTabBar: $showTabBar, selectedTab: $selectedTab)
        }
    }
}

#Preview {
    MainTabView()
}
