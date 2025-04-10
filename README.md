# ☕ CoffeeShop iOS App

**CoffeeShop** is a learning mobile app developed using `SwiftUI` and `MVVM` architecture. It mimics the behavior of a real coffee ordering app with screens:
- Onboarding
- Home
- Detail Item
- Cart (Order)
- Delivery

---

## 🛠️ Technologies

- Swift 5
- SwiftUI
- MVVM Architecture
- @StateObject / @Binding / @EnvironmentObject
- Custom TabBar
- MapKit (map with route)

---

## 📱 Screenshots

| Home Screen | Detail Item | Cart | Delivery |17 |-------------|-------------|------|----------||
| ![2025-04-1022 40 36-ezgif com-video-to-gif-converter](https://github.com/user-attachments/assets/8a4235ac-c3cd-4c7e-a205-07019c4c25e4) |

---

📱 Basic functionality:

Onboarding: welcome screen at first launch

HomeView: coffee selection by category with filtering and search

ProductCardView: product cards (2x2)

DetailItemView: product screen, add to cart

CartView: cart with sum calculation, delete and buy button

OrderView: checkout (UI under development)

DeliveryView: delivery screen with route display on map and courier name

CustomTabBarView: custom bottom bar with selection animation.

Translated with DeepL.com (free version)

## 📚 Project Structure:

```
├── View/
│ ├── HomeView.swift
│ ├── CartView.swift
│ ├── CartView.swift │ ├── DetailItemView.swift
│ ├── DeliveryView.swift
│ ├── OrderView. swift
│ └── TabBar/
│ │ ├── MainTabView.swift
│ └── CustomTabBarView.swift
├── ViewModel/
│ └── ProductViewModel.swift
├── Model/
│ └── Product. swift
```

---

## ✨ Project goal:

Demonstrate Junior iOS developer skills:
- UI implementation by layout
- Status and navigation management
- Working with user input and data display
- Map connectivity (MapKit)

Translated with DeepL.com (free version)

## 📌 Note

The project is created for Junior iOS developer portfolio purposes and demonstrates UI/UX, navigation, architecture and state management skills.

## 🧑‍💻 Author

Bohdan Borysenko
[LinkedIn →](https://www.linkedin.com/in/bohdan-borysenko-11a104246/)  
