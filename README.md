# Online Exam App 🎓📚📓

Online Exam App is a **Flutter-based mobile application** that enables users to take online exams, track their results, and manage their progress efficiently. The app provides a seamless experience with features such as **secure authentication, subject-wise exam selection, timer-based MCQ tests, and result tracking**. Built using **MVI architecture and Cubit for state management**, the app ensures a **structured, scalable, and maintainable** codebase for future enhancements.

## Features ✨

### 🔐 Authentication
- **Login Screen**: Users can log in to access their exams.
- **Register Screen**: New users can create an account.
- **Forget Password Screen**: Users can reset their password securely.

### 📈 Home Screen
- Displays a list of **subjects**.
- Users can select a subject to view **available exams**.

### 📖 Exam Flow
1. **Exam Selection**: Choose an exam from a subject.
2. **Instruction Screen**: Displays exam **instructions, duration, and number of questions**.
3. **Start Exam Button**: Begins the exam.
4. **MCQ Exam Screen**:
   - Timer-based questions according to the exam's duration.
   - Multiple-choice questions with 4 answer options.
   - Users can navigate between questions.
5. **Result Screen**: Shows the user's score after completing the exam.

### 📊 Results Tab
- Displays **results of completed exams** categorized by subjects.
- Users can review past performance.

### 👤 Profile Tab
- Displays **user profile information**.
- Users can **update their password** and manage account settings.

## Project Structure 📂

The project follows a well-structured directory organization:

```
lib/
│── api/          # API manager and services for fetching exam data
│── auth/         # Login, Register, and Forget Password screens
│── home/         # Main screens for Subjects, Exams, and Navigation
│── exam/         # Exam process screens (Instructions, MCQ, Timer, Results)
│── profile/      # User profile and settings
│── results/      # Result tracking and performance history
│── l10n/         # Localization support for multiple languages
│── providers/    # ChangeNotifier classes for managing app state
│── utils/        # Utility files like colors, constants, and helpers
│── main.dart     # Entry point of the application
```

## Tech Stack 🛠️
- **Flutter**: For building the cross-platform mobile app.
- **MVI Architecture**: Ensures a structured and maintainable codebase.
- **Cubit (flutter_bloc)**: For efficient state management.
- **Injectable & GetIt**: For dependency injection.
- **Dio & Pretty Dio Logger**: For API integration and debugging.
- **Shared Preferences**: For local data storage.
- **Google Fonts**: For elegant and customizable typography.
- **Easy Localization**: Supports multiple languages.
- **Lottie**: For animations.
- **Flutter ScreenUtil**: For responsive UI design.
- **Flutter Spinkit**: For loading animations.
- **Connectivity Plus**: For network connectivity checks.
- **Syncfusion Flutter Charts**: For visualizing results and performance.
- **Flutter Timer Countdown**: For handling exam timers.
- **OTP Text Field**: For OTP-based authentication.

## Installation & Usage ⚡

1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/online-exam-app.git
   ```

2. Navigate to the project directory:
   ```sh
   cd online-exam-app
   ```

3. Install dependencies:
   ```sh
   flutter pub get
   ```

4. Run the app:
   ```sh
   flutter run
   ```

## Contribution 🌟
We welcome contributions! Feel free to **fork the repo**, create a new branch, and submit a **pull request**.

## Developers 👨‍💻
- **Mahmoud Mohamed Gamal**
- **Mohamed Sherif**
- **Mohamed Bishta**

  


https://github.com/user-attachments/assets/6f255309-58af-40e9-ba70-1b79a2c736e2


## License ✉️
This project is licensed under the **MIT License**.

---
Made with ❤️ in Flutter 🤖
