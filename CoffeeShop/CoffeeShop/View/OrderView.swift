//
//  OrderView.swift
//  CoffeeShop
//
//  Created by Bohdan Borysenko on 09.04.2025.
//

import Foundation
import SwiftUI

struct OrderView: View {
    @Binding var showTabBar: Bool

    var body: some View {
        VStack {
            Text("Order screen")
        }
        .onAppear {
            showTabBar = false // если нужно скрыть
        }
        .onDisappear {
            showTabBar = true
        }
    }
}

#Preview {
    OrderView(showTabBar: .constant(true))
}
