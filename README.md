# Boo
**(Dating App – Match UI Technical Test)**

Boo is a **Flutter-based** dating application developed as part of a technical assessment.
This project focuses primarily on the Match UI experience, including profile browsing, like interactions, and profile detail presentation.

The application is intentionally scoped to UI and interaction flow only, without backend integration, to highlight UI composition, state handling, and architectural decisions.

---

## Descriptions
Boo simulates the core experience of a dating app, allowing users to:
- Browse user profiles
- View profile details
- Navigate between profile sections
- Perform match-related actions (like, dislike, super like – UI only)

Due to the limited timeframe of the technical test, GetX is used to speed up development by simplifying:
- State management
- Dependency injection
- Navigation

The project is also prepared for future **modularization** using **[Melos](https://pub.dev/packages/melos)**, enabling better separation of concerns and encouraging the application of **SOLID principles**.

---
Scope & Limitations
- ✅ UI Match Flow Only
- ❌ No real backend / API integration
- ❌ No authentication
- ❌ No real matchmaking logic

This scope is intentional and aligned with the technical test requirements.

---
Architectural Considerations
- GetX
- Fast development with minimal boilerplate
- Clear reactive state handling
- Suitable for prototype & technical test scenarios
- Modular-Ready with Melos
- Prepared structure for multi-package architecture
- Feature-oriented separation (match, profile, shared UI)
- Easier scaling and maintenance
- SOLID Principles
- Single responsibility per widget / controller
- Clear separation between UI, controller, and domain models
- Easy to extend without modifying existing code

---

## Getting Started
Follow the instructions below to run the project locally.

### Prerequisites
Make sure you have the following installed:

- **Flutter SDK** (min. 3.38.3)
- **FVM** (recommended)
- **Android Studio or VS Code**
- **Android Emulator or iOS Simulator**
- **Git**
---

### Configurations

1. **Clone the repository**
```bash
git clone https://github.com/rahmat3nanda/boo.git
cd boo
```

2. **Install the repository**
```bash
flutter pub get
```
or if you use FVM
```bash
fvm use .
fvm flutter pub get
```
