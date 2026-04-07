# Velotoulouse

A bike sharing mobile application for Toulouse, France.

## Project Overview

- **Architecture**: MVVM with DTOs (Data Transfer Objects)
- **State Management**: Provider
- **Platform**: Flutter (Android)

## Features

- Station Map/List - Browse and search bike stations
- Station Details - View station availability and info
- Trip History - Track past rentals
- Payment System - Manage payment methods
- Rent Bike - Scan and rent bikes via QR code

## Project Structure

```
lib/
├── main_common.dart          # App entry point with providers
├── data/
│   ├── dtos/                 # Data transfer objects
│   └── repositories/         # Data repositories
├── model/                    # Domain models
└── ui/
    ├── screens/              # Screen widgets
    ├── states/               # ViewModels (ChangeNotifier)
    ├── themes/               # Theme configuration
    ├── utils/                # Utilities
    └── widget/               # Reusable widgets
```

## Getting Started

```bash
flutter pub get
flutter run
```

## Dependencies

- provider: ^6.1.5+1
- http: ^1.6.0
- intl: ^0.20.2
- uuid: ^4.5.3
