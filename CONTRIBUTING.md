# 🤝 Contributing to Arabico

Thank you for your interest in contributing to Arabico! This guide will help you get started with contributing to our Arabic content providers repository for CloudStream.

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Setup](#development-setup)
- [Contributing Guidelines](#contributing-guidelines)
- [Pull Request Process](#pull-request-process)
- [Issue Reporting](#issue-reporting)
- [Provider Development](#provider-development)
- [Testing Guidelines](#testing-guidelines)
- [Documentation](#documentation)

## 📜 Code of Conduct

By participating in this project, you agree to abide by our Code of Conduct:

- Be respectful and inclusive
- Welcome newcomers and help them get started
- Focus on constructive feedback
- Respect different viewpoints and experiences
- Show empathy towards other community members

## 🚀 Getting Started

### Prerequisites

Before you start contributing, ensure you have:

- Basic knowledge of Kotlin programming
- Understanding of CloudStream API
- Git and GitHub account
- Java 17+ installed
- Android development environment (optional but recommended)

### Ways to Contribute

- 🐛 **Report Bugs**: Found an issue? Let us know!
- 💡 **Suggest Features**: Have an idea? Share it!
- 🔧 **Fix Issues**: Help resolve existing problems
- 📖 **Improve Documentation**: Make our docs better
- 🌍 **Translations**: Help with localization
- ✨ **New Providers**: Add new content providers

## ⚙️ Development Setup

### 1. Fork and Clone

```bash
# Fork the repository on GitHub
# Then clone your fork
git clone https://github.com/YOUR_USERNAME/Arabico.git
cd Arabico

# Add upstream remote
git remote add upstream https://github.com/dhomred/Arabico.git
```

### 2. Environment Setup

```bash
# Install Java 17+ (if not already installed)
# Install Kotlin (optional, Gradle will handle it)

# Verify installations
java -version
```

### 3. Project Structure

```
Arabico/
├── build.gradle.kts          # Main build configuration
├── settings.gradle.kts       # Project settings
├── plugins.json             # Plugin metadata
├── repo.json                # Repository information
├── README.md                # Main documentation
├── CONTRIBUTING.md          # This file
├── build/                   # Built plugins (generated)
├── [ProviderName]/          # Provider directories
│   ├── build.gradle.kts     # Provider build config
│   └── src/main/kotlin/     # Provider source code
│       └── [ProviderName]Provider.kt
```

## 📋 Contributing Guidelines

### Code Style

We follow Kotlin coding conventions:

```kotlin
// Good example
class MyProvider : MainAPI() {
    override var mainUrl = "https://example.com"
    override var name = "MyProvider"
    override var lang = "ar"
    override val supportsLatest = true
    
    override suspend fun getMainPage(): HomePageResponse {
        // Implementation
    }
}

// Use meaningful variable names
val movieList = mutableListOf<SearchResponse>()

// Add comments for complex logic
// Parse video quality from the element
val quality = element.select(".quality").text()
```

### Naming Conventions

- **Provider Classes**: `[Name]Provider` (e.g., `Cima4uProvider`)
- **Variables**: `camelCase` (e.g., `mainUrl`, `movieList`)
- **Constants**: `UPPER_SNAKE_CASE` (e.g., `MAX_RETRIES`)
- **Functions**: `camelCase` (e.g., `getMainPage()`)

### Documentation

- Add KDoc comments for public functions
- Include examples when helpful
- Document complex algorithms
- Keep README files updated

## 🔄 Pull Request Process

### 1. Create a Branch

```bash
# Create a feature branch
git checkout -b feature/new-provider-cimanow

# Or for bug fixes
git checkout -b fix/tvlive-loading-issue
```

### 2. Make Your Changes

- Follow coding standards
- Add tests if applicable
- Update documentation
- Test your changes thoroughly

### 3. Commit Your Changes

```bash
# Stage your changes
git add .

# Commit with descriptive message
git commit -m "feat: add CimaNow provider with 1080p support

- Implement search functionality
- Add quality selection (360p-1080p)
- Include Arabic subtitles support
- Handle pagination for large catalogs

Fixes #123"
```

### 4. Push and Create PR

```bash
# Push to your fork
git push origin feature/new-provider-cimanow

# Create PR on GitHub
```

### 5. PR Template

When creating a pull request, include:

- **Description**: What does this PR do?
- **Type**: Feature, Bug fix, Documentation, etc.
- **Testing**: How did you test your changes?
- **Screenshots**: If applicable
- **Issues**: Reference related issues

## 🐛 Issue Reporting

### Bug Reports

Use this template:

```markdown
**Bug Description**
A clear description of the bug.

**Steps to Reproduce**
1. Go to '...'
2. Click on '...'
3. See error

**Expected Behavior**
What should have happened?

**Screenshots**
If applicable, add screenshots.

**Environment**
- CloudStream Version: [e.g., 4.2.0]
- Android Version: [e.g., 11]
- Device: [e.g., Samsung Galaxy S21]

**Additional Context**
Any other relevant information.
```

### Feature Requests

```markdown
**Feature Description**
A clear description of the feature.

**Problem It Solves**
What problem does this solve?

**Proposed Solution**
How should it work?

**Alternatives Considered**
Any other approaches you considered?

**Additional Context**
Any other relevant information.
```

## 🏗️ Provider Development

### Creating a New Provider

#### 1. Create Provider Directory

```bash
# Create provider directory
mkdir MyProvider
cd MyProvider

# Create build.gradle.kts
cat > build.gradle.kts << 'EOF'
import org.jetbrains.kotlin.gradle.dsl.KotlinJvmCompile

plugins {
    id("java-library")
    id("org.jetbrains.kotlin.jvm")
    id("com.github.johnrengelman.shadow") version "7.1.2"
}

dependencies {
    implementation("com.lagradost:cloudstream3:pre-release")
    implementation("org.jsoup:jsoup:1.15.3")
    implementation("com.fasterxml.jackson.module:jackson-module-kotlin:2.13.3")
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.6.4")
}

tasks.withType<KotlinJvmCompile> {
    kotlinOptions {
        jvmTarget = "17"
    }
}

java {
    sourceCompatibility = JavaVersion.VERSION_17
    targetCompatibility = JavaVersion.VERSION_17
}

tasks.shadowJar {
    archiveFileName.set("MyProvider.cs3")
    destinationDirectory.set(file("$rootDir/build"))
}

tasks.build {
    dependsOn(tasks.shadowJar)
}
EOF
```

#### 2. Implement Provider Class

```kotlin
// src/main/kotlin/MyProvider.kt
package com.arabico.providers

import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.*
import org.jsoup.Jsoup

class MyProvider : MainAPI() {
    // Basic configuration
    override var mainUrl = "https://myprovider.com"
    override var name = "MyProvider"
    override var lang = "ar"
    override val hasMainPage = true
    override val hasChromecastSupport = true
    override val hasDownloadSupport = true
    
    // Supported content types
    override val supportedTypes = setOf(
        TvType.Movie,
        TvType.TvSeries
    )
    
    // Main page sections
    override val mainPage = listOf(
        MainPageItem("الأفلام الجديدة", "new-movies"),
        MainPageItem("المسلسلات الجديدة", "new-series"),
        MainPageItem("الأكثر مشاهدة", "popular"),
        MainPageItem("الأفلام", "movies"),
        MainPageItem("المسلسلات", "series")
    )
    
    // Get main page content
    override suspend fun getMainPage(
        page: Int,
        request: MainPageRequest
    ): HomePageResponse {
        val doc = app.get("$mainUrl/${request.data}/page/$page").document
        val items = doc.select(".movie-item").map { element ->
            // Parse movie/series information
            val title = element.select(".title").text()
            val poster = element.select("img").attr("src")
            val href = element.select("a").attr("href")
            
            // Determine content type
            val isMovie = element.select(".type").text().contains("فيلم")
            
            if (isMovie) {
                MovieSearchResponse(
                    name = title,
                    url = fixUrl(href),
                    apiName = this.name,
                    type = TvType.Movie,
                    posterUrl = poster,
                    year = null
                )
            } else {
                TvSeriesSearchResponse(
                    name = title,
                    url = fixUrl(href),
                    apiName = this.name,
                    type = TvType.TvSeries,
                    posterUrl = poster,
                    year = null,
                    episodes = null
                )
            }
        }
        
        return HomePageResponse(listOf(HomePageList(request.name, items)), hasNext = items.isNotEmpty())
    }
    
    // Search functionality
    override suspend fun search(query: String): List<SearchResponse> {
        val doc = app.get("$mainUrl/search?s=$query").document
        
        return doc.select(".search-result").map { element ->
            val title = element.select(".title").text()
            val poster = element.select("img").attr("src")
            val href = element.select("a").attr("href")
            
            MovieSearchResponse(
                name = title,
                url = fixUrl(href),
                apiName = this.name,
                type = TvType.Movie,
                posterUrl = poster
            )
        }
    }
    
    // Load detailed information
    override suspend fun load(url: String): LoadResponse {
        val doc = app.get(url).document
        
        val title = doc.select("h1.title").text()
        val poster = doc.select(".poster img").attr("src")
        val description = doc.select(".description").text()
        val year = doc.select(".year").text().toIntOrNull()
        val rating = doc.select(".rating").text().toRatingInt()
        val tags = doc.select(".tags a").map { it.text() }
        
        // Check if it's a series
        val episodes = doc.select(".episode-item").map { episode ->
            val episodeName = episode.select(".episode-title").text()
            val episodeHref = episode.select("a").attr("href")
            
            Episode(
                name = episodeName,
                season = 1,
                episode = 1,
                data = episodeHref
            )
        }
        
        return if (episodes.isNotEmpty()) {
            TvSeriesLoadResponse(
                name = title,
                url = url,
                apiName = this.name,
                type = TvType.TvSeries,
                posterUrl = poster,
                year = year,
                plot = description,
                rating = rating,
                tags = tags,
                episodes = episodes
            )
        } else {
            MovieLoadResponse(
                name = title,
                url = url,
                apiName = this.name,
                type = TvType.Movie,
                posterUrl = poster,
                year = year,
                plot = description,
                rating = rating,
                tags = tags
            )
        }
    }
    
    // Load streaming links
    override suspend fun loadLinks(
        data: String,
        isCasting: Boolean,
        subtitleCallback: (SubtitleFile) -> Unit,
        callback: (ExtractorLink) -> Unit
    ): Boolean {
        val doc = app.get(data).document
        
        doc.select(".server-item").forEach { server ->
            val serverName = server.select(".server-name").text()
            val link = server.select("a").attr("href")
            
            // Extract quality from server info
            val quality = when {
                serverName.contains("1080") -> Qualities.P1080
                serverName.contains("720") -> Qualities.P720
                serverName.contains("480") -> Qualities.P480
                else -> Qualities.P360
            }
            
            callback.invoke(
                ExtractorLink(
                    source = serverName,
                    name = serverName,
                    url = link,
                    referer = mainUrl,
                    quality = quality
                )
            )
        }
        
        return true
    }
    
    // Helper function to fix URLs
    private fun fixUrl(url: String): String {
        return if (url.startsWith("http")) url else "$mainUrl$url"
    }
}
```

#### 3. Add to plugins.json

```json
{
    "iconUrl": "https://www.google.com/s2/favicons?domain=myprovider.com&sz=%size%",
    "apiVersion": 1,
    "repositoryUrl": "https://github.com/dhomred/Arabico",
    "fileSize": 15000,
    "status": 1,
    "language": "ar",
    "authors": ["YourName"],
    "tvTypes": ["Movie", "TvSeries"],
    "version": 1,
    "internalName": "MyProvider",
    "url": "https://github.com/dhomred/Arabico/raw/main/build/MyProvider.cs3",
    "name": "MyProvider"
}
```

## 🧪 Testing Guidelines

### Manual Testing

1. **Test Search**: Search for popular Arabic content
2. **Test Main Page**: Verify all sections load correctly
3. **Test Loading**: Load detailed information for movies/series
4. **Test Links**: Verify streaming links work
5. **Test Quality**: Check different quality options
6. **Test Subtitles**: Verify subtitle loading (if applicable)

### Test Content Suggestions

- **Movies**: "الكنز", "الفيل الأزرق", "كازابلانكا"
- **Series**: "الاختيار", "هوجان", "الكبير أوي"
- **Anime**: "ناروتو", "ون بيس", "هنتر x هنتر"

### Performance Testing

- Test with slow internet connection
- Test with large search queries
- Test pagination for main pages
- Test concurrent requests

## 📚 Documentation

### Code Documentation

```kotlin
/**
 * Loads detailed information about a movie or TV series
 * 
 * @param url The URL of the content page
 * @return LoadResponse containing detailed information
 * @throws Exception if the page cannot be loaded
 */
override suspend fun load(url: String): LoadResponse {
    // Implementation
}
```

### README Updates

When adding new providers:

1. Update the providers table
2. Add the provider to the appropriate category
3. Update feature lists if needed
4. Keep installation instructions current

## 🎉 Recognition

Contributors will be:

- Added to the contributors list
- Mentioned in release notes
- Given credit in provider metadata
- Invited to join the maintainer team (for significant contributions)

## 📞 Getting Help

- **Discord**: Join our [Discord Server](https://discord.gg/arabico)
- **Issues**: [GitHub Issues](https://github.com/dhomred/Arabico/issues)
- **Discussions**: [GitHub Discussions](https://github.com/dhomred/Arabico/discussions)

## 🏆 Best Practices

### Code Quality
- Write clean, readable code
- Use meaningful variable names
- Add comments for complex logic
- Follow Kotlin conventions

### Performance
- Minimize network requests
- Cache data when appropriate
- Handle errors gracefully
- Optimize for mobile devices

### User Experience
- Provide accurate content information
- Handle edge cases properly
- Show loading indicators
- Give clear error messages

### Security
- Validate all inputs
- Use HTTPS when possible
- Don't expose sensitive data
- Follow security best practices

---

**Thank you for contributing to Arabico! 🎉**