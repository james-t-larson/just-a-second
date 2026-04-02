# Just a Second

A Flutter timing game for iOS, Android, and Web. Test your internal clock by stopping the timer as close to 1.00 (or 5.00) seconds as possible!

## Concept
The game challenges players to press and hold a button, releasing it exactly at the target time.
- **Levels 1-5**: Target 1.00s with a visible timer.
- **Levels 6-10**: Target 1.00s, but the button and timer disappear while holding.
- **Levels 11-15**: Target 5.00s with a visible timer.

## Scoring
- **Exact match**: 100 points (for 1s) or 500 points (for 5s).
- **Proportional points**: The closer you are, the more points you get (e.g., 0.50s = 50 pts).
- **Over the limit**: Stopping after the target time results in **0 points**.

## Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.38.1 or higher)
- [Google Chrome](https://www.google.com/chrome/) (for Web testing)
- [Xcode](https://developer.apple.com/xcode/) (for iOS)
- [Android Studio](https://developer.android.com/studio) (for Android)

## Project Structure
- `lib/models/`: Data structures for Levels and Game Results.
- `lib/providers/`: State management using Provider (Game progress and Timer logic).
- `lib/screens/`: UI screens (Main Menu, Level Select, Game, Results, Transitions).
- `lib/utils/`: Core logic (Scoring formula and Level definitions).
- `lib/widgets/`: Reusable UI components.

## Getting Started

1.  **Clone the repository**:
    ```bash
    git clone <repository-url>
    cd just-a-second
    ```
2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```

## Platform-Specific Setup

### Web Interface (Recommended for Development)
To start the web interface:
```bash
flutter run -d chrome
```
*Note: Make sure your browser window is active for the best timing precision.*

### iOS (iPhone)
1.  **Install CocoaPods**:
    ```bash
    # If not already installed
    sudo gem install cocoapods
    ```
2.  **Setup iOS project**:
    ```bash
    cd ios
    pod install
    cd ..
    ```
3.  **Run on Simulator/Device**:
    - Open `ios/Runner.xcworkspace` in Xcode.
    - Select your target device.
    - Run from Xcode or via CLI:
      ```bash
      flutter run -d ios
      ```

### Android
1.  **SDK Tools**:
    - Open Android Studio -> SDK Manager.
    - Ensure **Android SDK Command-line Tools (latest)** is installed.
2.  **Accept Licenses**:
    ```bash
    flutter doctor --android-licenses
    ```
3.  **Run on Emulator/Device**:
    - Start an Android Emulator from Android Studio.
    - Run via CLI:
      ```bash
      flutter run -d android
      ```

## Testing
Run unit tests for scoring logic:
```bash
flutter test
```

## Production Build

### Web
```bash
flutter build web
```

### Android (APK)
To generate an APK for testing or direct installation:
```bash
flutter build apk --release
```
The output file will be located at:
`build/app/outputs/flutter-apk/app-release.apk`

### Android (App Bundle)
To generate an App Bundle (AAB) for Google Play:
```bash
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
# Then open ios/Runner.xcworkspace in Xcode and perform an Archive.
```
