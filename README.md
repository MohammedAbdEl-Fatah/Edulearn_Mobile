# EduLearn Mobile

A modern Flutter-based mobile learning platform designed for both students and teachers. The app provides a seamless experience for educational content delivery, course management, and user authentication.

## Version

**Current Version:** 1.0.0+1

## Features

### Implemented Features

- **Authentication System**
  - User login with email and password
  - Student registration
  - Teacher registration
  - Role selection (Student/Teacher)
  - Email confirmation with OTP
  - Forgot password functionality
  - Password reset with OTP verification
  - JWT token management (access & refresh tokens)
  - Secure logout

- **Onboarding**
  - Interactive onboarding flow with learning illustrations
  - Multi-step introduction screens

- **Splash Screen**
  - Animated splash screen with branding

- **Home Screen**
  - Main dashboard for users

- **User Management**
  - User profile management
  - Profile data retrieval

### Upcoming Features

- **Course Management**
  - Course creation (for teachers)
  - Course enrollment (for students)
  - Course content viewing
  - Progress tracking

## Tech Stack

### Core Framework
- **Flutter**: ^3.11.4 - Cross-platform UI framework
- **Dart**: Programming language

### State Management
- **flutter_bloc**: ^9.1.1 - State management using BLoC pattern
- **equatable**: ^3.0.0 - Value equality for objects

### Networking
- **dio**: ^5.11.1 - HTTP client for API calls
- **pretty_dio_logger**: ^1.4.0 - HTTP request/response logging

### Data Handling
- **json_annotation**: ^4.12.0 - JSON serialization annotations
- **freezed_annotation**: ^3.1.0 - Code generation for immutable classes
- **freezed**: ^3.2.5 - Code generation for data classes
- **json_serializable**: ^6.14.1 - JSON serialization code generation
- **build_runner**: ^2.15.1 - Code generation runner


### Storage
- **flutter_secure_storage**: ^11.2.0 - Secure storage for sensitive data (tokens)
- **shared_preferences**: ^2.5.6 - Local storage for app preferences

### Environment & Configuration
- **flutter_dotenv**: ^6.1.0 - Environment variable management

### Dependency Injection
- **get_it**: ^9.3.0 - Service locator pattern

### UI Components
- **pin_code_fields**: ^9.5.1 - OTP input fields
- **flutter_animate**: ^4.5.2 - Animation utilities

## Architecture

The project follows **Clean Architecture** principles with the following layers:

```
lib/
├── core/                    # Shared utilities and configurations
│   ├── config/             # App configuration
│   ├── di/                 # Dependency injection
│   ├── errors/             # Error handling (Failure, Result)
│   ├── extensions/         # Dart extensions
│   ├── network/            # API client, endpoints, safe API calls
│   ├── router/             # App routing configuration
│   ├── storage/            # Local storage implementations
│   ├── theme/              # App colors, images, styles
│   └── widgets/            # Reusable UI widgets
├── feature/                # Feature modules
│   ├── auth/              # Authentication feature
│   │   ├── data/          # Data layer (models, datasources, repositories)
│   │   ├── domain/        # Domain layer (entities, usecases, repositories)
│   │   └── presentation/  # Presentation layer (screens, cubits, widgets)
│   ├── home/              # Home feature
│   ├── onbording/         # Onboarding feature
│   ├── splash/            # Splash feature
│   └── user/              # User management feature
├── edulearn_app.dart       # Main app entry
├── main.dart               # App initialization
└── observer_bloc.dart      # BLoC observer
```

## Error Handling

The app implements a comprehensive error handling system using the Result pattern:

### Failure Types

- **NoInternetFailure**: No internet connection
- **TimeoutFailure**: Request timeout
- **BadRequestFailure**: 400 Bad Request
- **UnauthorizedFailure**: 401 Unauthorized
- **ForbiddenFailure**: 403 Forbidden
- **NotFoundFailure**: 404 Not Found
- **ClientFailure**: Custom 4xx client errors
- **ServerFailure**: 5xx server errors
- **UnknownFailure**: Unknown errors

### Error Handling Flow

1. **safeApiCall**: Wraps all API calls with try-catch
2. **mapDioException**: Maps Dio exceptions to Failure types
3. **Result<T>**: Returns either Success<T> or Failed<Failure>
4. **fold pattern**: Handles success/failure cases in UI

### Example Usage

```dart
Future<Result<User>> getUserProfile() async {
  return safeApiCall(() => apiService.getUserProfile());
}

// In usecase
final result = await repository.getUserProfile();
return result.fold(
  (failure) => failure.message,
  (user) => user,
);
```

## API Endpoints

### Authentication Endpoints

- `POST /auth/login` - User login
- `POST /auth/sign-up/student` - Student registration
- `POST /auth/sign-up/teacher` - Teacher registration
- `POST /auth/confirm-email` - Email confirmation with OTP
- `POST /auth/logout` - User logout
- `POST /auth/refresh-token` - Refresh access token
- `POST /auth/generated-otp` - Generate/resend OTP
- `POST /auth/forget-password` - Initiate password reset

### User Endpoints

- `GET /user/profile` - Get user profile

## Assets

### Images

- `Logo.png` - Main app logo
- `LogoSplash.png` - Splash screen logo
- `Learning_illustration_0.png` - Onboarding illustration 1
- `Learning_illustration_1.png` - Onboarding illustration 2
- `Learning_illustration_2.png` - Onboarding illustration 3

All images are located in `assets/images/` directory.

## Testing

### Testing Setup

The project includes testing dependencies:

- **flutter_test**: Flutter testing framework
- **bloc_test**: ^10.0.0 - Testing BLoC state management
- **mocktail**: ^1.0.5 - Mocking API calls and dependencies

### Test Structure

```
test/
├── core/
│   └── errors/           # Error handling tests
└── widget_test.dart      # Widget tests
```

### Running Tests

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/core/errors/error_handle_test.dart

# Run with coverage
flutter test --coverage
```

## Getting Started

### Prerequisites

- Flutter SDK 3.11.4 or higher
- Dart SDK compatible with Flutter version

### Installation

1. Clone the repository:
```bash
git clone <https://github.com/MohammedAbdEl-Fatah/Edulearn_Mobile>
cd edulearn_mobile
```

2. Install dependencies:
```bash
flutter pub get
```

3. Set up environment variables:
```bash
# Create assets/env/.env file
# Add your API base URL and other configuration
```

4. Run code generation (for models):
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

5. Run the app:
```bash
# For Android & iOS
flutter run

# For Web
flutter run -d chrome
```

## Project Structure Details

### Clean Architecture Layers

**Data Layer** (`feature/*/data/`)
- **Models**: Data transfer objects with JSON serialization
- **Datasources**: Remote API and local storage implementations
- **Repositories**: Concrete implementations of domain repositories

**Domain Layer** (`feature/*/domain/`)
- **Entities**: Business objects
- **UseCases**: Business logic operations
- **Repository Interfaces**: Abstract contracts for data layer

**Presentation Layer** (`feature/*/presentation/`)
- **Screens**: UI screens
- **Cubits/Blocs**: State management
- **Widgets**: Feature-specific reusable widgets

### Dependency Injection

Uses GetIt service locator pattern:
```dart
// Register services in lib/core/di/injection_container.dart
sl.registerLazySingleton(() => DioClient());
sl.registerLazySingleton(() => AuthRepositoryImpl(remoteDataSource: sl()));
```

## Known Issues & Fixes

### Common Problems and Solutions

1. **Build Runner Conflicts**
   - Problem: Code generation conflicts when running build_runner
   - Solution: Run `flutter pub run build_runner build --delete-conflicting-outputs`

2. **Shared Preferences Android Version**
   - Problem: Compatibility issues with Android plugin
   - Solution: Pinned to version 2.4.8 in dependency_overrides

3. **Secure Storage on iOS**
   - Problem: Keychain access issues
   - Solution: Ensure proper entitlements are configured in iOS project

4. **API Timeout**
   - Problem: Requests timing out on slow networks
   - Solution: Adjust timeout values in DioClient configuration

5. **Token Refresh**
   - Problem: Access token expiration handling
   - Solution: Implement automatic token refresh using interceptors

## Contact Information

For questions, support, or contributions:

- **Developer**: Mohammed Mohammed Abd Elfatah
- **Email**: mohammedabdelfatah837@gmail.com
- **GitHub**: (https://github.com/MohammedAbdEl-Fatah)

---

## Resources

- [BLoC Library](https://bloclibrary.dev/)
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
