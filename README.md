# SellerCart

A mobile-first Flutter application that allows freelancers and small business owners to create digital visiting cards and mini-shop catalogs sharable via WhatsApp.

## Features

### 🔐 Authentication
- Google Sign-In integration
- Phone OTP verification via Firebase
- User profile management

### 💳 Digital Visiting Cards
- Create professional digital visiting cards
- 3 beautiful templates (Modern Blue, Classic White, Elegant Dark)
- QR code generation for easy sharing
- Social media links integration
- WhatsApp sharing capabilities

### 🛍️ WhatsApp Mini-Shop
- Product catalog management
- Image upload with compression
- Price and description management
- WhatsApp message template generation
- Direct sharing to WhatsApp

### 📱 Dashboard & Settings
- User profile overview
- Quick stats and actions
- Profile editing
- Theme settings (Light/Dark mode ready)
- Logout functionality

## Tech Stack

- **Frontend**: Flutter
- **Backend**: Firebase (Firestore, Auth, Storage, Analytics)
- **Authentication**: Google Sign-In + Phone OTP
- **State Management**: Provider
- **Image Handling**: Firebase Storage + image_picker
- **QR & Sharing**: qr_flutter + share_plus
- **Platform**: Android (Phase 1), iOS (Phase 2)

## Setup Instructions

### Prerequisites
- Flutter SDK (3.16.9 or higher)
- Android Studio with Android SDK
- Firebase project setup

### Firebase Configuration
1. Create a new Firebase project at [Firebase Console](https://console.firebase.google.com/)
2. Enable Authentication (Google Sign-In and Phone)
3. Enable Firestore Database
4. Enable Firebase Storage
5. Replace the placeholder `android/app/google-services.json` with your actual Firebase configuration file

### Installation
1. Clone the repository
```bash
git clone https://github.com/dwarakanathvarunkumar/appdev-android.git
cd appdev-android
```

2. Install dependencies
```bash
flutter pub get
```

3. Configure Firebase
   - Replace `android/app/google-services.json` with your Firebase config
   - Update Firebase project settings as needed

4. Run the app
```bash
flutter run
```

## Project Structure

```
lib/
├── core/                   # App configuration and constants
├── features/              # Feature-based modules
│   ├── auth/             # Authentication screens
│   ├── cards/            # Digital visiting cards
│   ├── dashboard/        # Main dashboard
│   ├── settings/         # App settings
│   └── shop/             # Product catalog
└── shared/               # Shared components
    ├── models/           # Data models
    ├── providers/        # State management
    ├── services/         # Firebase services
    └── widgets/          # Reusable widgets
```

## Data Models

### User Profile
- uid, name, orgName, category
- phone, email, profileImageURL
- joinedAt timestamp

### Digital Card
- Basic info (name, designation, organization)
- Contact details (phone, email, WhatsApp)
- Social links and QR code
- Template selection

### Product Catalog
- Product name, price, image
- Description and timestamps
- User association

## Key Features Implementation

### Authentication Flow
1. Login screen with Google Sign-In and Phone OTP options
2. Phone verification with OTP input
3. Profile setup for new users
4. Automatic navigation based on auth state

### Card Creation
1. Template selection (3 options)
2. Form-based information input
3. Real-time preview
4. QR code generation
5. Sharing capabilities

### Shop Management
1. Product CRUD operations
2. Image upload with compression
3. Grid-based catalog view
4. WhatsApp message generation
5. Direct sharing integration

## 📱 Screenshots

### Authentication Flow
![Login Screen](screenshots/auth/login_screen.png)
*Login screen with Google Sign-In and Phone OTP options*

![Phone Verification](screenshots/auth/phone_verification.png)
*Phone OTP verification screen*

![Profile Setup](screenshots/auth/profile_setup.png)
*User profile setup screen*

### Digital Visiting Cards
![Cards List](screenshots/cards/cards_list.png)
*List of user's digital cards*

![Card Form](screenshots/cards/card_form.png)
*Card creation/editing form with templates*

![Card Preview](screenshots/cards/card_preview.png)
*Card preview with QR code generation*

### WhatsApp Mini-Shop
![Products List](screenshots/shop/products_list.png)
*Product catalog grid view*

![Product Form](screenshots/shop/product_form.png)
*Add/edit product form with image upload*

![WhatsApp Sharing](screenshots/shop/whatsapp_sharing.png)
*WhatsApp sharing with product catalog*

### Dashboard & Settings
![Dashboard](screenshots/dashboard/home_screen.png)
*Main dashboard with navigation and user overview*

![Settings](screenshots/settings/settings_screen.png)
*Settings menu with profile and app options*

*Note: Screenshots will be populated after Firebase configuration and app testing. See [screenshots/README.md](screenshots/README.md) for details.*

## Edge Cases Handled

- ✅ Form validation for all inputs
- ✅ Image compression before upload
- ✅ Offline handling with error messages
- ✅ Auto-save functionality
- ✅ Loading states throughout the app
- ✅ Error handling and user feedback

## Version

**MVP v1.0** - Ready for internal testing

## Contributing

This is a private project for internal testing. For any issues or feature requests, please contact the development team.

## License

Private - All rights reserved.
