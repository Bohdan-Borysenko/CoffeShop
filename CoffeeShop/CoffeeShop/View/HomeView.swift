//
//  Home.swift
//  CoffeeShop
//
//  Created by Bohdan Borysenko on 09.04.2025.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @Binding var showTabBar: Bool

    var body: some View {
        ZStack {
            Color("ColorStar") // фон
            Text("Home")
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView(showTabBar: .constant(true))
}
