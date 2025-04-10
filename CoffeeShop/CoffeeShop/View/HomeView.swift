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
    @State private var selectedCategory: String = "All"
    @State private var searchText: String = ""
    @Binding var selectedTab: Int
    
    let categories = ["All", "Espresso", "Cappuccino", "Latte", "Flat White"]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                headerSection
                searchSection
                categorySection
                specialOfferSection

                // Только продукты скроллятся
                ScrollView(.vertical, showsIndicators: false) {
                    productListSection
                        .padding(.bottom)
                }
            }
            .padding(.horizontal)
            .padding(.top)
            .onAppear {
                showTabBar = true
            }
            .navigationBarHidden(true)
        }
    }
    
    // MARK: - Header
    var headerSection: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Location")
                    .font(.caption)
                    .foregroundColor(.gray)
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Bilzen, Tanjungbalai")
                        .fontWeight(.bold)
                }
            }
            Spacer()
            Image("profile") // или иконка профиля
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
        }
    }
    
    // MARK: - Search
    var searchSection: some View {
        
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Search coffee...", text: $searchText)
                .textFieldStyle(PlainTextFieldStyle())
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
    }
    
    // MARK: - Categories
    var categorySection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(categories, id: \.self) { category in
                    Text(category)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(selectedCategory == category ? Color("ColorButton") : Color.gray.opacity(0.2))
                        .foregroundColor(selectedCategory == category ? .white : .black)
                        .cornerRadius(20)
                        .onTapGesture {
                            selectedCategory = category
                        }
                }
            }
        }
    }
    
    // MARK: - Banner / Special Offer
    var specialOfferSection: some View {
        VStack(alignment: .leading) {
            Image("Promo") // Подставь свою картинку из Assets
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
        }
    }
    
    // MARK: - Product List
    var filteredProducts: [Product] {
        let categoryFiltered = selectedCategory == "All"
            ? sampleProducts
            : sampleProducts.filter { $0.category == selectedCategory }

        if searchText.isEmpty {
            return categoryFiltered
        } else {
            return categoryFiltered.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var productListSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Special for you")
                .font(.title2)
                .bold()

            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(filteredProducts) { product in
                    NavigationLink(destination: DetailItemView(showTabBar: $showTabBar, product: product)) {
                        ProductCardView(product: product)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView(showTabBar: .constant(true), selectedTab: .constant(0))
        .environmentObject(ProductViewModel())
}
