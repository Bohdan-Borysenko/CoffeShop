//
//  CoffeeShopApp.swift
//  CoffeeShop
//
//  Created by Bohdan Borysenko on 09.04.2025.
//

import SwiftUI

@main
struct CoffeeShopApp: App {
    
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if hasSeenOnboarding {
                MainTabView()
            } else {
                OnboardingView()
            }
        }
    }
}
