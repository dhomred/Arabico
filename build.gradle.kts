import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

plugins {
    kotlin("jvm") version "1.9.10"
    id("com.github.johnrengelman.shadow") version "8.1.1"
}

allprojects {
    repositories {
        mavenCentral()
        maven("https://jitpack.io")
        maven("https://repo.recloudstream.xyz")
    }
}

subprojects {
    apply(plugin = "org.jetbrains.kotlin.jvm")
    apply(plugin = "com.github.johnrengelman.shadow")

    dependencies {
        implementation("com.github.recloudstream:cloudstream:pre-release")
        implementation("org.jsoup:jsoup:1.16.1")
        implementation("com.fasterxml.jackson.module:jackson-module-kotlin:2.15.2")
        implementation("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.7.3")
    }

    tasks.withType<KotlinCompile> {
        kotlinOptions {
            jvmTarget = "17"
        }
    }

    tasks.withType<JavaCompile> {
        sourceCompatibility = JavaVersion.VERSION_17.toString()
        targetCompatibility = JavaVersion.VERSION_17.toString()
    }

    tasks.register("buildAll") {
        group = "build"
        description = "Build all provider plugins"
        
        subprojects.forEach { subproject ->
            dependsOn(":${subproject.name}:build")
            dependsOn(":${subproject.name}:shadowJar")
        }
    }

    tasks.register("copyPlugins") {
        group = "build"
        description = "Copy all built plugins to build directory"
        
        doLast {
            val buildDir = file("$rootDir/build")
            buildDir.mkdirs()
            
            subprojects.forEach { subproject ->
                val pluginFile = file("${subproject.buildDir}/libs/${subproject.name}.jar")
                if (pluginFile.exists()) {
                    pluginFile.copyTo(file("$buildDir/${subproject.name}.cs3"), overwrite = true)
                }
            }
        }
        
        dependsOn("buildAll")
    }
}

tasks.register("cleanAll") {
    group = "build"
    description = "Clean all subprojects"
    
    subprojects.forEach { subproject ->
        dependsOn(":${subproject.name}:clean")
    }
}

tasks.register("buildRepository") {
    group = "build"
    description = "Build complete repository with all plugins"
    
    dependsOn("copyPlugins")
    
    doLast {
        println("✅ Repository build completed!")
        println("📦 Plugins copied to: build/")
        println("🔗 Repository URL: file://$buildDir/repo.json")
    }
}