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

    var body: some View {
        ZStack {
            currentView()

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
            HomeView(showTabBar: $showTabBar)
        case 1:
            DetailltemView(showTabBar: $showTabBar)
        case 2:
            OrderView(showTabBar: $showTabBar)
        case 3:
            DeliveryView(showTabBar: $showTabBar, selectedTab: $selectedTab)
        default:
            HomeView(showTabBar: $showTabBar)
        }
    }
}
#Preview {
    MainTabView()
}
