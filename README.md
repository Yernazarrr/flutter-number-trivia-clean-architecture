# 🚀 Flutter Number Trivia (TDD + Clean Architecture)

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=flat&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=flat&logo=dart)
![Architecture](https://img.shields.io/badge/Architecture-Clean-blueviolet)
![Tests](https://img.shields.io/badge/Tests-Passing-brightgreen)

## 📌 Overview

A Flutter application that demonstrates **Test-Driven Development (TDD)** and **Clean Architecture** principles using a simple Number Trivia feature.

The project is designed as a scalable and production-ready template for building Flutter apps with proper separation of concerns.

> [!NOTE]
> This project follows Reso Coder's TDD Clean Architecture course and serves as a reference implementation for real-world Flutter applications.

---

## 📁 Project Structure

```
lib/
├── core/
│   ├── error/
│   │   ├── exceptions.dart
│   │   └── failures.dart
│   ├── network/
│   │   └── network_info.dart
│   └── usecases/
│       └── usecase.dart
├── features/
│   └── number_trivia/
│       ├── data/
│       │   ├── datasources/
│       │   ├── models/
│       │   └── repositories/
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       └── presentation/
│           ├── bloc/
│           ├── pages/
│           └── widgets/
└── injection_container.dart
```

---

## 🏛️ Architecture Layers

### 1. Domain Layer _(innermost — pure Dart)_

The **heart** of the application. Contains:

- `Entities` — core business objects
- `Repositories` — abstract contracts
- `Use Cases` — single-responsibility business logic units

### 2. Data Layer

Implements domain contracts. Contains:

- `Models` — serializable versions of entities
- `Data Sources` — remote (API) and local (cache)
- `Repository Implementations`

### 3. Presentation Layer

UI + state management. Contains:

- `BLoC` — business logic component
- `Pages` — full screens
- `Widgets` — reusable UI components

> [!IMPORTANT]
> Dependencies always point **inward**. The domain layer has zero dependencies on Flutter or any external packages.

---

## 🧪 TDD Approach

Every feature in this project was written **test-first**:

```
Red  🔴  → Write a failing test
Green 🟢  → Write minimum code to pass
Refactor 🔵 → Clean up without breaking tests
```

Test coverage includes:

- [x] Use Cases
- [x] Repository implementations
- [x] BLoC / Cubit
- [x] Data models (JSON serialization)
- [x] Remote & local data sources
- [ ] Widget tests _(in progress)_
- [ ] Integration tests _(planned)_

---

## 📦 Dependencies

### 🔧 Core

| Package        | Version | Purpose                                                                                       |
| -------------- | ------- | --------------------------------------------------------------------------------------------- |
| `flutter_bloc` | ^9.1.1  | State management using the BLoC/Cubit pattern                                                 |
| `equatable`    | ^2.0.8  | Value-based object comparison without manually overriding `==` and `hashCode`                 |
| `fpdart`       | ^1.2.0  | Functional programming — `Either<Failure, T>` for typed error handling instead of `try/catch` |

### 🌐 Network

| Package                            | Version  | Purpose                                                                                |
| ---------------------------------- | -------- | -------------------------------------------------------------------------------------- |
| `dio`                              | ^5.9.2   | HTTP client with support for interceptors, request cancellation, and FormData          |
| `retrofit`                         | ^4.9.2   | Generates type-safe API clients from annotations (similar to Retrofit on Android)      |
| `internet_connection_checker_plus` | ^2.9.1+2 | Verifies actual internet connectivity beyond just Wi-Fi or mobile network availability |

### 💾 Storage

| Package              | Version | Purpose                                                            |
| -------------------- | ------- | ------------------------------------------------------------------ |
| `shared_preferences` | ^2.5.5  | Local caching of simple key-value data (last query, user settings) |

### 💉 Dependency Injection

| Package      | Version  | Purpose                                                                                   |
| ------------ | -------- | ----------------------------------------------------------------------------------------- |
| `get_it`     | ^9.2.1   | Service locator — global registry for all app dependencies                                |
| `injectable` | ^2.7.1+4 | Annotations (`@injectable`, `@lazySingleton`) to auto-generate `get_it` registration code |

### 🧊 Code Generation (Annotations)

| Package              | Version | Purpose                                                                           |
| -------------------- | ------- | --------------------------------------------------------------------------------- |
| `freezed_annotation` | ^3.1.0  | Annotations for `freezed` — immutable classes, `copyWith`, `when/map` union types |
| `json_annotation`    | ^4.11.0 | Annotations for `json_serializable` — JSON ↔ Dart object mapping                  |

---

### 🛠️ Dev Dependencies

| Package                | Version | Purpose                                                                               |
| ---------------------- | ------- | ------------------------------------------------------------------------------------- |
| `build_runner`         | ^2.13.1 | Runs code generation for `freezed`, `injectable`, `retrofit`, and `json_serializable` |
| `freezed`              | ^3.2.5  | Generates immutable data classes with `copyWith`, union types, and pattern matching   |
| `json_serializable`    | ^6.13.1 | Generates `fromJson` / `toJson` methods for data models                               |
| `injectable_generator` | ^2.12.1 | Generates `configureDependencies()` — the `get_it` registration setup                 |
| `retrofit_generator`   | ^10.2.5 | Generates API client implementations from `retrofit` annotated interfaces             |
| `mockito`              | ^5.6.4  | Creates mock objects for unit tests (repositories, data sources, etc.)                |
| `flutter_lints`        | ^6.0.0  | Official Flutter lint rules for clean and idiomatic Dart code                         |

> [!TIP]
> After adding new annotated classes, always run:
>
> ```bash
> dart run build_runner build --delete-conflicting-outputs
> ```

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK `>=3.0.0`
- Dart SDK `>=3.0.0`
- Android Studio / VS Code

### Installation

**1. Clone the repository**

```bash
git clone https://github.com/your-username/flutter-number-trivia.git
cd flutter-number-trivia
```

**2. Install dependencies**

```bash
flutter pub get
```

**3. Run code generation**

```bash
dart run build_runner build --delete-conflicting-outputs
```

**4. Run the app**

```bash
flutter run
```

---

## 🧩 Running Tests

**Run all tests:**

```bash
flutter test
```

**Run with coverage:**

```bash
flutter test --coverage
```

**Run a specific test file:**

```bash
flutter test test/features/number_trivia/domain/usecases/get_concrete_number_trivia_test.dart
```

> [!TIP]
> Use `flutter test --reporter expanded` for verbose output showing each individual test case.

---

## 🔌 API

This app consumes the **Numbers API**:

```
GET http://numbersapi.com/{number}
GET http://numbersapi.com/random
```

**Example response:**

```
"42 is the answer to the Ultimate Question of Life, the Universe, and Everything."
```

---

## 🧠 Key Concepts Demonstrated

- **Clean Architecture** — strict separation of domain, data, and presentation layers
- **TDD** — test-first development with `mockito` and `bloc_test`
- **BLoC pattern** — reactive, stream-based state management
- **Either monad** — typed error handling via `fpdart` without exceptions
- **Dependency Injection** — automatic dependency registration via `injectable` + `get_it`
- **Code Generation** — `freezed`, `retrofit`, `json_serializable` to eliminate boilerplate

---

## 🙌 Acknowledgements

- [Reso Coder](https://resocoder.com) — TDD Clean Architecture Flutter course
- [Numbers API](http://numbersapi.com) — free number trivia facts API

---

_Made with ❤️ using Flutter_
