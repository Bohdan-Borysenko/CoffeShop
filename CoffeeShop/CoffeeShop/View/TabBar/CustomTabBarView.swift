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
        HStack(spacing: 40) {
            ForEach(0..<4) { index in
                Button(action: {
                    selectedTab = index
                }) {
                    VStack(spacing: 4) {
                        Image(systemName: tabIcon(for: index))
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(selectedTab == index ? Color("ColorButton") : .gray)
                        
                        Circle()
                            .frame(width: 6, height: 6)
                            .foregroundColor(selectedTab == index ? Color("ColorButton") : .clear)
                    }
                }
            }
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .shadow(color: Color.black.opacity(0.05), radius: 10, y: -2)
    }

    func tabIcon(for index: Int) -> String {
        switch index {
        case 0: return "house"
        case 1: return "heart"
        case 2: return "bag"
        case 3: return "bell"
        default: return "circle"
        }
    }
}
