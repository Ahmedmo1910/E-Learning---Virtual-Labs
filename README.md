# 🚀 Mega Project at DEPI  
## E-Learning & Virtual Labs

---

# Student App 🎓

A **Flutter-based mobile application** for students, developed as part of the **E-Learning & Virtual Labs Mega Project (DEPI)**.  
The app is fully integrated with the **Teacher App**, ensuring that any updates made by teachers—**courses, sessions, exams, or announcements**—are instantly reflected for students.  
Students can also **record attendance**, access learning materials, and participate in exams seamlessly.

---

## ✨ Features
- **User Authentication:** Secure login and signup system.  
- **Real-Time Updates:** Courses, sessions, and exams sync instantly from the Teacher App.  
- **Virtual Labs:** Interactive environments for practical learning.  
- **Attendance Tracking:** Students can mark attendance for each session.  
- **Assignments & Exams:** Online submissions and assessments.  
- **Notifications:** Real-time alerts for new updates and announcements.  
- **Onboarding & Splash Screens:** Smooth first-time user experience.

---

## 📱 Screenshots

### Splash  
![Splash Screen](https://github.com/Ahmedmo1910/E-Learning---Virtual-Labs/blob/07b200b123c0ee72cb572d23c1d908fdce10e1b5/Splash%20.jpeg?raw=true)

### Onboarding
![Onboarding 1](https://github.com/Ahmedmo1910/E-Learning---Virtual-Labs/blob/main/onboarding%201.jpeg?raw=true)
![Onboarding 2](https://github.com/Ahmedmo1910/E-Learning---Virtual-Labs/blob/58067b583ebb10c1fdc8572c984cc483b31dfe86/on%20boarding%202.jpeg?raw=true)
![Onboarding 3](https://github.com/Ahmedmo1910/E-Learning---Virtual-Labs/blob/21c65cd62c6fa14efdbd34fce9e13924723ed6d4/on%20boarding%203.jpeg?raw=true)

### Authentication
![Auth Screen](https://github.com/Ahmedmo1910/E-Learning---Virtual-Labs/blob/11608ba90affb0cbedfe0f06148a1a0ecf076439/auth%20screen%20.jpeg)

### Home 
![Home Screen](https://github.com/Ahmedmo1910/E-Learning---Virtual-Labs/blob/a0fb5633bb950bf4274b870175a3fa5de53f42f6/home%20screen.jpeg)

### Lessons 
![Session Screen](screenshots/session.png)

### Attendance & Exams
![Attendance Screen](screenshots/attendance.png)
![Exams Screen](screenshots/exams.png)

---

## 🏗 Architecture & Tech Stack
- **Flutter & Dart**
- **Clean Architecture**
  - Presentation
  - Domain
  - Data
- **State Management:** Cubit (Bloc)
- **Networking:** Dio
- **Local Storage:** Shared Preferences
- **Authentication:** Secure Auth Flow
- **UI Flow:** Splash Screen & Onboarding

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK **>= 3.0**
- Dart **>= 3.0**
- Android Studio or VS Code
- iOS Simulator (macOS only)

### Installation
```bash
# Clone the repository
git clone https://github.com/Ahmedmo1910/E-Learning---Virtual-Labs.git

# Navigate to the Student App directory
cd E-Learning---Virtual-Labs/student_app

# Install dependencies
flutter pub get

# Run the app
flutter run
