# CRUD-Flutter

# 📱 Flutter Full Stack CRUD App (Task Manager)

A clean architecture Flutter application that supports **Create, Read, Update, and Delete** operations for tasks, with **local storage (Hive)**, **REST API integration**, and **BLoC state management**.

---

## 🚀 Features

- ✅ Task CRUD functionality
- ✅ Clean Architecture: Data → Domain → Presentation
- ✅ Local storage with Hive
- ✅ API-ready via `http` or `dio`
- ✅ BLoC (flutter_bloc)
- ✅ Form validation
- ✅ Responsive layout
- ✅ Dark/Light mode
- ✅ Search, Sort, Pagination *(Coming in Bonus)*
- ✅ Firebase or WebSocket real-time updates *(Planned)*

---

## 🏗 Folder Structure
lib/
├── core/ # Dependency injection, app-wide configs
├── features/
│ └── tasks/
│ ├── data/ # Hive models, services, impl repos
│ ├── domain/ # Repositories & BLoC
│ └── presentation/ # Pages, widgets


---

## ⚙️ Setup Instructions

1. ✅ Clone the repo
2. ✅ Install dependencies:

flutter pub get

3.✅ Generate Hive adapters:

flutter packages pub run build_runner build

4.✅ Run the app:

flutter run

📦 Dependencies
dependencies:
  flutter_bloc: ^8.1.3
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  path_provider: ^2.1.2
  http: ^0.13.6
  get_it: ^7.6.0

🔌 API Endpoints
This app is designed to integrate with any REST API that follows this structure:
| Method | Endpoint     | Description     |
| ------ | ------------ | --------------- |
| GET    | `/tasks`     | Fetch all tasks |
| POST   | `/tasks`     | Create a task   |
| PUT    | `/tasks/:id` | Update a task   |
| DELETE | `/tasks/:id` | Delete a task   |

🔁 Local Persistence
Local tasks are stored using Hive in:
Hive.openBox<TaskModel>('tasks');

🧪 Testing
Manual testing:

✅ Add task

✅ Edit task

✅ Delete task

✅ Persistence after restart

📦 Bonus Features (Planned)
 🔍 Search with debounce

 🔃 Sorting & filtering

 🔄 Firebase sync (offline-first)

 🔐 Google Sign-In (firebase_auth)

 🌓 Theme toggle

 🧩 Data import/export

✍️ Author
Aryan Vishwakarma
Built as part of the internship challenge at Alkraj Developers Pvt. Ltd.

---

## 📤 Postman Collection

I’ll now generate the `postman_collection.json` file for you based on these endpoints.

Would you prefer the API hosted with:
- A mock server (e.g., [json-server](https://github.com/typicode/json-server))?
- Firebase functions?
- A live endpoint?

Let me know your choice, and I’ll send the Postman JSON tailored for it. Ready to continue?

