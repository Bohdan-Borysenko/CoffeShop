//
//  DetailItemView.swift
//  CoffeeShop
//
//  Created by Bohdan Borysenko on 09.04.2025.
//

import Foundation
import SwiftUI

struct DetailltemView: View {
    @Binding var showTabBar: Bool

    var body: some View {
        VStack {
            Text("Detail screen")
        }
        .onAppear {
            showTabBar = true
        }
    }
}

#Preview {
    DetailltemView(showTabBar: .constant(true))
}

