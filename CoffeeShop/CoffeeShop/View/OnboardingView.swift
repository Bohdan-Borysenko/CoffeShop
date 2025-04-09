//
//  ContentView.swift
//  CoffeeShop
//
//  Created by Bohdan Borysenko on 09.04.2025.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    Image("sView")
                        .resizable()
                        .scaledToFill()
                        .frame(height: geometry.size.height * 0.72)
                        .clipped()

                    Rectangle()
                        .fill(Color.black)
                        .frame(height: geometry.size.height * 0.5)
                    }
                    .ignoresSafeArea()
                }

            VStack {
                Spacer()
                
                Text("Coffee so good,\nyour taste buds \n will love it.")
                    .font(.custom("Sora-SemiBold", size: 42))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 5)

                Text("The best grain, the finest roast,\nthe powerful flavor.")
                    .font(.custom("Sora-Regular", size: 20))
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                    .padding(.horizontal, 32)

                
                Button(action: {
                    withAnimation {
                        hasSeenOnboarding = true
                    }
                }) {
                    Text("Get Started")
                        .font(.custom("Sora-Regular", size: 23))
                        .fontWeight(.semibold)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.vertical, 24) // высота фона
                        .padding(.horizontal, 82) // ширина фона
                        .background(Color("ColorButton"))
                        .cornerRadius(12)
                }
            }
        }
    }
}

#Preview {
    OnboardingView()
}
