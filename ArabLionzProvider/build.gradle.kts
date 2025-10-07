import org.jetbrains.kotlin.gradle.dsl.KotlinJvmCompile

plugins {
    id("java-library")
    id("org.jetbrains.kotlin.jvm")
    id("com.github.johnrengelman.shadow")
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
    archiveFileName.set("ArabLionzProvider.cs3")
    destinationDirectory.set(file("$rootDir/build"))
}

tasks.build {
    dependsOn(tasks.shadowJar)
}