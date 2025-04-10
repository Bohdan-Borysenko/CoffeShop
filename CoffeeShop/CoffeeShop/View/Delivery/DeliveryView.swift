//
//  DeliveryView.swift
//  CoffeeShop
//
//  Created by Bohdan Borysenko on 09.04.2025.
//

import Foundation
import SwiftUI
import MapKit

struct DeliveryView: View {
    @Binding var showTabBar: Bool
    @Binding var selectedTab: Int

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )

    var body: some View {
        ZStack {
            // MARK: - Fullscreen map
            Map(coordinateRegion: $region)
                .ignoresSafeArea()

            VStack {
                // MARK: - Top bar
                HStack {
                    Button(action: {
                        selectedTab = 0
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .frame(width: 32, height: 32)
                            .background(Color("ColorButton"))
                            .clipShape(Circle())
                    }

                    Spacer()

                    Text("Delivery")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)

                    Spacer()

                    Color.clear.frame(width: 32) // для симметрии с кнопкой слева
                }
                .padding(.horizontal)
                .padding(.bottom, 460)

                Spacer()

                // MARK: - Bottom card
                VStack(spacing: 16) {
                    Text("10 minutes left")
                        .font(.headline)

                    Text("Delivery to Jl. Kpg Sutoyo")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Divider()

                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)

                        VStack(alignment: .leading, spacing: 4) {
                            Text("Delivered your order")
                                .font(.subheadline)
                                .bold()
                            Text("We deliver your goods to you in the shortest possible time.")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }

                        Spacer()
                    }

                    Divider()

                    HStack(spacing: 16) {
                        Image("courier") // Название изображения курьера
                            .resizable()
                            .scaledToFill()
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())

                        VStack(alignment: .leading) {
                            Text("Johan Hawn")
                                .font(.headline)
                            Text("Personal Courier")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }

                        Spacer()

                        Image(systemName: "phone.fill")
                            .foregroundColor(.green)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(24)
                .shadow(radius: 5)
                .padding()
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
