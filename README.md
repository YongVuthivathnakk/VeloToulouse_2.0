# Velotoulouse 2.0

A bike sharing mobile application for Phnom Penh, Cambodia, inspired by the official Velotoulouse bike booking app.

## App Description

A small Flutter project focused on bike sharing functionality with 6 core user stories.

## User Stories

1. **Select a Pass** - Choose from available subscription passes
2. **View Stations on Map** - Browse and search bike stations on an interactive map
3. **View Bikes at Station** - See available bikes at each station
4. **Book a Bike** - Reserve a bike for pickup
5. **Payment** - Process payments for subscriptions and rentals
6. **Pick up the Bike** - Unlock and pick up the booked bike

## Implementation

- **Architecture**: MVVM (Model-View-ViewModel)
- **Backend**: Firebase (Realtime Database)
- **State Management**: Provider
- **Platform**: Flutter (Android)

## Project Structure

```
lib/
├── main_common.dart          # App entry point with providers
├── data/
│   ├── dtos/                 # Data transfer objects
│   └── repositories/        # Data repositories (Firebase & Mock)
├── models/                   # Domain models
├── service/                 # Business logic services
├── ui/
│   ├── screens/             # Screen widgets with ViewModels
│   ├── states/              # State management (ChangeNotifier)
│   ├── themes/              # Theme configuration
│   ├── widgets/             # Reusable widgets
│   └── animations/          # UI animations
└── utils/                   # Utilities
```

## Features

- Interactive map with station markers
- Station details with real-time availability
- Multiple pass/subscription options
- One-time ticket purchase
- Bike booking and reservation
- QR code-based bike pickup
- Payment integration
- Trip history tracking

## Getting Started

```bash
flutter pub get
flutter run
```

## Dependencies

- provider: ^6.1.5+1
- firebase_core: ^4.7.0
- firebase_database: ^12.3.0
- flutter_map: ^8.2.2
- latlng: ^2.0.7
- latlong2: ^0.9.1
- rxdart: ^0.28.0
- carousel_slider: ^5.1.2
- http: ^1.6.0
- intl: ^0.20.2
- uuid: ^4.5.3
- cupertino_icons: ^1.0.8
