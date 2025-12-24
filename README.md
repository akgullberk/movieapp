# 🎬 MovieApp

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Clean Architecture](https://img.shields.io/badge/Clean-Architecture-green?style=for-the-badge)
![BLoC](https://img.shields.io/badge/State-BLoC-blue?style=for-the-badge)

## 📚 Makale ve Detaylı Anlatım

Bu projenin geliştirme süreci, mimari kararları ve kullanılan teknolojiler hakkında daha detaylı bilgi edinmek isterseniz Medium üzerindeki inceleme yazıma göz atabilirsiniz:

🔗 **[Flutter ve Clean Architecture ile Modern Bir Film Uygulaması](https://medium.com/@akgullberk/flutter-ve-clean-architecture-ile-modern-bir-film-uygulamas%C4%B1-a6a630cf53b5)**

MovieApp, kullanıcıların en güncel filmleri ve TV dizilerini keşfedebileceği, fragmanlarını izleyebileceği ve detaylı bilgiler edinebileceği modern bir mobil uygulamadır. **Clean Architecture** prensipleri ve **BLoC/Cubit** state management kullanılarak geliştirilmiştir.

---
## 📱 Ekran Görüntüleri
<div style="display:flex; gap:12px; flex-wrap:wrap;">
  <img src="https://github.com/user-attachments/assets/066d1646-4c18-4442-ae82-7b0c0e961e4b" width="220"/>
  <img src="https://github.com/user-attachments/assets/2709e029-15bd-43a4-afd0-73bfe6e6576d" width="220"/>
  <img src="https://github.com/user-attachments/assets/1cece66d-1ab5-4992-a45e-34e82980a557" width="220"/>
  <img src="https://github.com/user-attachments/assets/58ec1ba9-51aa-4d1d-85a4-39606ea0df92" width="220"/>
</div>

<br/>

<div style="display:flex; gap:12px; flex-wrap:wrap;">
  <img src="https://github.com/user-attachments/assets/d17d9889-0bb2-49ec-945b-57ce8c7ff545" width="220"/>
  <img src="https://github.com/user-attachments/assets/89b365b4-5a72-48a9-94bf-e4dd1e329e2d" width="220"/>
  <img src="https://github.com/user-attachments/assets/33e8e3c6-31c9-43bd-8012-e31b957cf821" width="220"/>
  <img src="https://github.com/user-attachments/assets/94658803-daee-424d-b53a-3d83c48c2475" width="220"/>
</div>






## 🚀 Özellikler

- **Giriş ve Kayıt Sistemi:** Güvenli kullanıcı kimlik doğrulaması.
- **Trendler ve Vizyondakiler:** En popüler içerikleri ana sayfada keşfedin.
- **Detaylı İnceleme:** Film ve diziler hakkında detaylı bilgi, puanlama ve yayın tarihi.
- **Fragman İzleme:** YouTube entegrasyonu ile içeriklerin fragmanlarına anında erişim.
- **Akıllı Arama:** İster film ister TV dizisi olsun, aradığınız içeriği saniyeler içinde bulun.
- **Öneriler ve Benzerler:** İzlediğiniz içeriğe benzer yeni yapımları keşfedin.
- **Modern UI/UX:** Karanlık tema odaklı, göze hitap eden ve kullanıcı dostu arayüz.

---

## 🛠️ Teknik Stack

- **Framework:** [Flutter](https://flutter.dev)
- **State Management:** [flutter_bloc](https://pub.dev/packages/flutter_bloc) (Cubit & BLoC)
- **Dependency Injection:** [get_it](https://pub.dev/packages/get_it)
- **Networking:** [dio](https://pub.dev/packages/dio)
- **Local Storage:** [shared_preferences](https://pub.dev/packages/shared_preferences)
- **Functional Programming:** [dartz](https://pub.dev/packages/dartz) (Either yapısı için)
- **Video Player:** [chewie](https://pub.dev/packages/chewie), [video_player](https://pub.dev/packages/video_player), [youtube_player_flutter](https://pub.dev/packages/youtube_player_flutter)
- **Logging:** [logger](https://pub.dev/packages/logger)

---

## 🏗️ Mimari Yapı: Clean Architecture

Proje, sürdürülebilirlik ve test edilebilirlik için **Clean Architecture** prensiplerine göre katmanlandırılmıştır:

- **Data Katmanı:** API servisleri, modeller (JSON mappers) ve repository implementasyonları.
- **Domain Katmanı:** Entity'ler, Repository arayüzleri ve Use Case'ler (İş mantığı).
- **Presentation Katmanı:** UI bileşenleri, sayfalar ve BLoC/Cubit ile state yönetimi.
- **Core:** Uygulama genelinde kullanılan konfigürasyonlar (tema, network, sabitler).

---

## 📂 Proje Dizini

```text
lib/
├── common/           # Genel widget'lar, yardımcı sınıflar ve bloc'lar
├── core/             # Tema, network ayarları, sabitler ve temel sınıflar
├── features/         # Özellik bazlı modüller
│   ├── auth/         # Kayıt ve giriş işlemleri
│   ├── home/         # Ana sayfa (Trendler, vs.)
│   ├── movie/        # Film detay ve mantığı
│   ├── tv/           # TV dizisi detay ve mantığı
│   ├── search/       # Arama özelliği
│   ├── splash/       # Açılış ekranı
│   └── watch/        # Video oynatma ve öneriler
├── service_locator.dart # Bağımlılık yönetimi (DI)
└── main.dart         # Uygulama giriş noktası
```

## 🎨 Tasarım Detayları

Uygulama, sinematik bir deneyim sunmak için **Koyu Tema (Dark Mode)** üzerine inşa edilmiştir.

- **Ana Renk:** `#E21221` (Kırmızı)
- **Arka Plan:** `#181A20` (Koyu Gri/Siyah)
- **İkincil Arka Plan:** `#35383F`
