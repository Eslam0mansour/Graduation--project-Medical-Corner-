
# Medical Corner Flutter App

**Name:** Medical Corner  
**Description:**  Flutter application for medical diagnostics 
## Overview

Medical Corner is a comprehensive medical application that leverages deep learning models to detect pneumonia and brain tumors. It also provides predictions for heart disease and diabetes. The app incorporates a user-friendly interface and essential features to enhance health awareness and promote proactive healthcare.

## Features

- **User Authentication:** Secure login and signup functionality.
- **User Profile Management:** Easy access to user profiles and health information.
- **Health News:** Stay updated with the latest health news and articles.
- **Medical Diagnostics:** 
  - Pneumonia detection
  - Brain tumor detection
  - Heart disease prediction
  - Diabetes prediction
- **Machine Learning Integration:** Utilizes TensorFlow Lite (tflite) models for medical predictions.

## Updates

### New Version
- Recent updates with enhanced architecture and additional features are ongoing. Stay tuned for the latest improvements!

[Watch the new version demo](https://user-images.githubusercontent.com/101331596/211470104-a113341a-51da-4860-86c1-dd77d7fb4dfd.mp4)

### Previous Version
- [Watch the old version demo](https://user-images.githubusercontent.com/101331596/210183460-a9aace73-0759-4a25-9dc6-acfc45e3684c.mp4)

## Getting Started

To get started with the project, follow the instructions below:

1. **Clone the repository:**
   ```bash
   git clone https://your-repo-url.git
   cd intro_example
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

## Project Structure

```yaml
publish_to: 'none'  # Remove this line if you wish to publish to pub.dev

version: 1.0.0+1

environment:
  sdk: ">=2.15.0-268.0.dev <3.0.0"

dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  flutter_svg: ^2.0.10+1
  image_picker: ^1.1.2
  provider: ^6.0.2
  firebase_auth: ^5.1.0
  firebase_core: ^3.1.0
  firebase_ml_model_downloader: ^0.3.0+1
  cloud_firestore: ^5.0.1
  google_sign_in: ^6.2.1
  tflite: ^1.1.2
  intl: ^0.19.0
  flutter_bloc: ^8.0.1
  bloc: ^8.0.3
  dio: ^5.4.3+1
  hexcolor: ^3.0.1
  shared_preferences: ^2.0.13
  lottie: ^3.1.2
  animated_splash_screen: ^1.2.0
  screenshot: ^3.0.0
  permission_handler: ^11.3.1
  image_gallery_saver: ^2.0.3
  flutter_launcher_icons: ^0.13.1
  firebase_storage: ^12.0.1
  adaptive_dialog: ^2.1.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^4.0.0
  flutter_native_splash: any

flutter_native_splash:
  color: "#ffffff"
  image: assets/images/icon.png

flutter_icons:
  android: true
  ios: true
  image_path: "assets/images/ic_launcher.png"

flutter:
  uses-material-design: true
  assets:
    - assets/
    - assets/images/
    - assets/lottie_animations/
    - assets/tflite_models/
  fonts:
    - family: seguisb
      fonts:
        - asset: assets/seguisb.ttf
```

