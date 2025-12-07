# 📜 ŁatwaUstawa (EasyLaw)

**Democratizing legislation through AI. Built for HackNation 2025.**

![HackNation 2025](https://img.shields.io/badge/Event-HackNation_2025-blueviolet)
![Flutter](https://img.shields.io/badge/Frontend-Flutter-blue)
![FastAPI](https://img.shields.io/badge/Backend-FastAPI-green)
![AI](https://img.shields.io/badge/AI-DeepSeek_%2F_HuggingFace-orange)

## 🚀 About The Project

**ŁatwaUstawa** is a mobile application designed to bridge the gap between complex legislative language and the average citizen. We believe that law should be accessible to everyone, not just lawyers.

Using advanced AI (DeepSeek via Hugging Face), the application summarizes complex parliamentary bills into simple, bite-sized, and neutral posts. It allows users to stay informed about changes in the law, track the activity of Members of Parliament (MPs), and understand the impact of new regulations on their daily lives.

## ✨ Key Features (Current MVP)

### 📱 Legislative Feed
* **Social Media Style Interface:** Browse bills like a social feed (inspired by X/Twitter).
* **Clear Summaries:** Each post contains a clear title and a short, AI-generated summary.
* **At a Glance:** View categories, like counts, and the current processing status of the bill immediately.

### 🔍 Bill Details
* **Accessible Language:** Deep dives into bills using formatting (bolding, emojis) to make reading easier.
* **Transparency:** See exactly which MP submitted the bill.
* **Source Material:** Direct links to official documents and sources.
* **Timeline:** Visual tracking of the legislative work status.

### 🏛️ MPs Database (Posłowie)
* **Comprehensive List:** Browse all current Members of Parliament.
* **MP Profiles:** Detailed views including party affiliation, profession, and photos.

### ⚙️ Settings & Privacy
* **Data Protection:** Dedicated section for GDPR/RODO information.
* **About:** Information about the creators and the project version (2025).

## 🏗️ Architecture & Tech Stack

The project consists of a mobile frontend and a Python-based backend service.

### Frontend
* **Framework:** Flutter (Dart)
* **State Management:** Provider / BLoC
* **UI/UX:** Material Design 3 with a focus on high accessibility (WCAG).

### Backend (Prototype / Logic)
* **Framework:** FastAPI (Python)
* **AI Engine:**
    * Utilizes **DeepSeek** models via **Hugging Face API**.
    * **Functionality:** Fetches raw legislative texts and converts them into layman's terms.
* *Note: The backend logic and AI summarization module are fully functional but currently exist as a standalone service ready for full integration with the frontend.*

## 🔮 Roadmap (MVP+)

We have an ambitious vision for the future development of ŁatwaUstawa:

* **🔔 Smart Notifications:** Push notifications when a new bill appears in your favorite category or is submitted by an MP you follow.
* **👴 Accessibility Mode:** Text-to-Speech (TTS) auto-reading features designed specifically for seniors.
* **🤖 AI Chatbot (RAG):** Ability to "chat" with a specific bill to ask questions (e.g., "How does this affect my taxes?").
* **⭐ Follow System:** Ability to follow specific MPs or legislative tracks.
* **🔎 Advanced Search:** Filtering bills by specific keywords, dates, or parties.
* **👆 Gamified Discovery:** An interactive, gesture-based interface for quickly browsing and discovering new legislation.

## 📥 Installation

### Prerequisites
* Flutter SDK
* Python 3.10+ (for backend)

### Run Frontend
```bash
cd frontend
flutter pub get
flutter run
```
### Run Backend
```bash
cd backend
pip install -r requirements.txt
uvicorn main:app --reload
```
## 👥 The Team
Created with ❤️ during HackNation 2025.
- Piotr Wittig - Frontend, full-stack
- Patryk Piaścik - AI specialist
- Mikołaj Mołodecki - Backend developer
- Feliks Łubiński - Frontend, UIX


## Gallery
<img width="1206" height="2622" alt="simulator_screenshot_26D99C8C-916A-4633-8A88-71D175D557D1" src="https://github.com/user-attachments/assets/b85d1593-c993-4dda-b022-9993c9357050" />
<img width="1206" height="2622" alt="simulator_screenshot_A3C593C6-D35C-46B0-A52C-3BF272175D6B" src="https://github.com/user-attachments/assets/aa1886f6-93ad-4a94-baf1-30f39f994a2c" />
<img width="1206" height="2622" alt="simulator_screenshot_577401B4-B9A8-4481-B24E-6F9CB2379590" src="https://gi<img width="1206" height="2622" alt="simulator_screenshot_55CCC158-8A61-4930-92D8-3E61EC1BE537" src="https://github.com/user-attachments/assets/66d2b311-12a6-48ac-abe1-b558671e069d" />
thub.com/user-attachments/assets/b4d0686e-e467-4cb0-8da1-26f7cabbced8" />
