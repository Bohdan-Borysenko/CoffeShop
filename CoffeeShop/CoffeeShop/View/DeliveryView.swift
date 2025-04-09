//
//  DeliveryView.swift
//  CoffeeShop
//
//  Created by Bohdan Borysenko on 09.04.2025.
//

import Foundation
import SwiftUI

struct DeliveryView: View {
    @Binding var showTabBar: Bool
    @Binding var selectedTab: Int

    var body: some View {
        VStack(spacing: 20) {
            Text("Delivery Screen")
                .font(.largeTitle)

            Button(action: {
                selectedTab = 0 // вернуться на Home
            }) {
                Text("Back to Home")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("ColorButton"))
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding(.horizontal, 32)
            }
        }
        .onAppear {
            showTabBar = false
        }
        .onDisappear {
            showTabBar = true
        }
    }
}

#Preview {
    DeliveryView(showTabBar: .constant(true), selectedTab: .constant(0))
}
