plugins {
    id("com.android.application") version "8.1.0" apply false // Replace with your desired Android Gradle plugin version
    id("org.jetbrains.kotlin.android") version "1.9.0" apply false // Replace with your desired Kotlin Gradle plugin version
}

android {
    // ... your existing android configurations
    externalNativeBuild {
        cmake {
            path = file("src/main/cpp/CMakeLists.txt")
        }
    }
}

dependencies {
    // ... your existing dependencies
}