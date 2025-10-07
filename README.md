# 🎬 Arabico - Arabic Content Providers for CloudStream

Arabico is a comprehensive repository of Arabic content providers for CloudStream, offering a rich collection of movies, TV series, anime, and live TV channels from various Arabic streaming platforms.

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Supported Providers](#supported-providers)
- [Installation](#installation)
- [Usage](#usage)
- [Development](#development)
- [Contributing](#contributing)
- [License](#license)

## 🎯 Overview

Arabico provides high-quality Arabic content providers that integrate seamlessly with CloudStream. Our repository includes both on-demand content (movies, series, anime) and live TV channels, all carefully curated and maintained for optimal performance.

## ✨ Features

- **🎭 Multiple Content Types**: Movies, TV Series, Anime, Live TV, and more
- **🌍 Arabic Language Focus**: Specialized in Arabic content with proper localization
- **📺 Live TV Support**: Access to popular Arabic TV channels
- **🎨 High Quality**: Support for up to 1080p and 4K streaming
- **⚡ Fast & Reliable**: Optimized for performance and stability
- **🔧 Regular Updates**: Continuous maintenance and feature improvements
- **📱 Multi-Platform**: Compatible with Android, Android TV, and Fire TV

## 📺 Supported Providers

### 🎬 Movies & TV Series
| Provider | Content Types | Status | Description |
|----------|---------------|--------|-------------|
| **FaselHD** | Movies, Series, Anime, Asian Drama | ✅ Active | Premium Arabic content with high quality |
| **MyCima** | Movies, Series, Anime | ✅ Active | Popular Arabic streaming platform |
| **FajerShow** | Movies, Series | ✅ Active | Arabic entertainment hub |
| **ArabSeed** | Movies, Series | ✅ Active | Arabic content aggregator |
| **Shoffree** | Movies, Series | ✅ Active | Free Arabic streaming |
| **SagaProvider** | Movies, Series | ✅ Active | Arabic content provider |
| **Toktok** | Movies, Series | ✅ Active | Arabic entertainment platform |
| **Cima4uProvider** | Movies, Series | ✅ Active | Arabic cinema content |
| **ArabLionzProvider** | Movies, Series | ✅ Active | Arabic media platform |
| **CimaNowProvider** | Movies, Series | ⚠️ Slow | Arabic content (loads slowly) |
| **CoolCima** | Movies, Series, Anime | ✅ Active | Arabic content with anime |
| **JOY Cinema** | Movies, Series | ✅ Active | Arabic cinema hub |
| **Y.A.P.S** | Movies, Series, Anime | ✅ Active | Yet Another Piracy Site |
| **Drama Cafe** | Movies, Series, Anime | ✅ Active | Drama and entertainment |
| **365 SHOW** | Movies, Series, Anime | ✅ Active | 365 days of Arabic content |
| **Braflix** | Movies, Series | ✅ Active | Arabic Netflix alternative |

### 📡 Live TV
| Provider | Content Types | Status | Description |
|----------|---------------|--------|-------------|
| **TvLive** | Live TV | ✅ Active | Sports and Arabic channels |
| **3isk** | Live TV | ✅ Active | Arabic live streaming |
| **3isk v2** | Movies, Series | ✅ Active | Enhanced 3isk with 1080p |
| **Ohatv** | Live TV | ✅ Active | Arabic live television |
| **Syrialive** | Live TV | ✅ Active | Syrian live TV channels |
| **Dlhd** | Live TV | ✅ Active | Sports live streams (Halal mode) |

### 🎌 Anime
| Provider | Content Types | Status | Description |
|----------|---------------|--------|-------------|
| **Animeiat** | Anime | ✅ Active | Arabic anime platform |
| **AnimeBlkom** | Anime, Anime Movies, OVA | ✅ Active | Arabic anime content |
| **Anime4upPack** | Anime, Anime Movies | ✅ Active | Anime4up and Witanime pack |
| **Anime3rb** | Anime, Anime Movies | ✅ Active | Arabic anime hub |

### 🏀 Sports & Special
| Provider | Content Types | Status | Description |
|----------|---------------|--------|-------------|
| **Btolat** | Sports | ✅ Active | Arabic sports content |
| **asian2tv** | Movies, Series | ✅ Active | Asian drama content |
| **EgyDead** | Movies, Series, Anime | ✅ Active | Egyptian content |

## 📥 Installation

### ✅ الطريقة الأسهل: إضافة مباشرة من GitHub

1. **افتح تطبيق CloudStream**
2. **اذهب إلى الإعدادات** ⚙️ Settings
3. **ابحث عن "Extensions" أو "الملحقات"**
4. **اختر "Repository" أو "المستودعات"**
5. **اضغط على زر الإضافة** ➕ Add Repository
6. **أدخل هذا الرابط**:
   ```
   https://github.com/dhomred/Arabico
   ```
7. **اضغط "إضافة" أو "Add"**
8. **انتظر تحميل الملحقات** (بضع ثواني)

### 📱 الطريقة اليدوية (للمتقدمين)

1. **حمّل ملفات `.cs3` من مجلد [build](build/)**
2. **في CloudStream، اذهب إلى Settings → Extensions → Install from Storage**
3. **اختر الملفات التي حملتها**

### 🎯 للمبتدئين: استخدم أداة الإعداد

**شغّل ملف الإعداد**:
```
setup-cloudstream.bat
```

**سيقوم بإرشادك خطوة بخطوة**

### 📋 التحقق من النجاح

✅ **إذا رأيت رسالة "تمت الإضافة بنجاح"**
✅ **إذا ظهر عدد الملحقات المتاحة (30+ ملحق)**
✅ **إذا ظهرت أيقونة المستودع في القائمة**

**🎉 مبروك! أصبح لديك الآن أكبر مكتبة محتوى عربي!**

## 🚀 Usage

### Basic Usage
1. Install the Arabico repository using one of the methods above
2. Browse available providers in the Extensions section
3. Enable your desired providers
4. Start browsing Arabic content!

### Advanced Features
- **Search**: Use the search function to find specific content
- **Filters**: Filter by quality, genre, or year
- **Favorites**: Add content to your favorites for quick access
- **Subtitles**: Most content includes Arabic subtitles
- **Quality Selection**: Choose from multiple quality options (360p to 1080p)

## 🛠️ Development

### Prerequisites
- Java 17 or higher
- Kotlin 1.9+
- Android SDK (for testing)
- CloudStream API knowledge

### Project Structure
```
Arabico/
├── build.gradle.kts          # Main build configuration
├── settings.gradle.kts       # Project settings
├── plugins.json             # Plugin metadata
├── repo.json                # Repository metadata
├── build/                   # Built plugins
├── TvLive/                  # TvLive provider
│   ├── src/main/kotlin/
│   └── build.gradle.kts
├── 3isk/                    # 3isk provider
│   ├── src/main/kotlin/
│   └── build.gradle.kts
├── Braflix/                 # Braflix provider
│   ├── src/main/kotlin/
│   └── build.gradle.kts
└── 365_SHOW/               # 365 SHOW provider
    ├── src/main/kotlin/
    └── build.gradle.kts
```

### Building from Source
```bash
# Clone the repository
git clone https://github.com/dhomred/Arabico.git

# Build all providers
./gradlew buildAll

# Build specific provider
./gradlew :TvLive:build

# Copy plugins to build directory
./gradlew copyPlugins
```

### Creating a New Provider
1. Create a new directory for your provider
2. Add `build.gradle.kts` with proper configuration
3. Implement your provider class extending `MainAPI`
4. Add metadata to `plugins.json`
5. Build and test your provider

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

### Ways to Contribute
- 🐛 **Report Bugs**: Open an issue with detailed information
- 💡 **Suggest Features**: Share your ideas for new providers or improvements
- 🔧 **Submit Pull Requests**: Contribute code improvements or new providers
- 📖 **Improve Documentation**: Help improve our documentation
- 🌍 **Translations**: Help translate content to other languages

### Development Guidelines
- Follow Kotlin coding standards
- Maintain compatibility with CloudStream API
- Test your changes thoroughly
- Update documentation as needed
- Respect content providers' terms of service

## 📄 License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## ⚖️ Legal Notice

This repository is for educational and personal use only. We do not host any content and are not responsible for the content provided by third-party services. Users are responsible for complying with their local laws and the terms of service of the content providers.

## 🙏 Acknowledgments

- **CloudStream Team**: For the amazing streaming platform
- **Contributors**: All the amazing people who contribute to this project
- **Community**: The Arabic streaming community for their support

## 📞 Support

- 💬 **Discord**: Join our [Discord Server](https://discord.gg/arabico)
- 📧 **Email**: support@arabico.com
- 🐛 **Issues**: [GitHub Issues](https://github.com/dhomred/Arabico/issues)

---

<div align="center">
  <p><strong>Made with ❤️ by the Arabico Team</strong></p>
  <p><em>Bringing the best of Arabic entertainment to CloudStream</em></p>
</div>
