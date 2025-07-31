// build.gradle.kts

// Apply the plugin for building an Android application.
plugins {
    id("com.android.application")
    // If you're using Kotlin for your source code, add the Kotlin plugin.
    // id("org.jetbrains.kotlin.android")
}

android {
    // The namespace is required for projects using Android Gradle Plugin 8.0+.
    // It should match the package name from your AndroidManifest.xml.
    namespace = "com.primefilemanger"
    compileSdk = 34 // Target the latest stable SDK, Android 14.

    defaultConfig {
        applicationId = "com.primefilemanger"
        minSdk = 21       // Corresponds to Android 5.0 (Lollipop).
        targetSdk = 34    // Must match compileSdk for best practices.
        versionCode = 306 // From your AndroidManifest.xml.
        versionName = "1.53.6b2" // From your AndroidManifest.xml.

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
    }

    // Signing configurations for building a standalone app.
    // The keystore information should be securely stored (e.g., in gradle.properties)
    // and not hardcoded here.
    signingConfigs {
        create("release") {
            // This block would replace the `LOCAL_CERTIFICATE := platform` for standalone builds.
            // You would need to generate your own upload key.
            // storeFile = file("path/to/your/keystore.jks")
            // storePassword = System.getenv("KEYSTORE_PASSWORD")
            // keyAlias = System.getenv("KEY_ALIAS")
            // keyPassword = System.getenv("KEY_PASSWORD")
        }
    }

    buildTypes {
        release {
            // Enables code shrinking, obfuscation, and optimization for the release build.
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
            // Assign the signing configuration to the release build type.
            signingConfig = signingConfigs.getByName("release")
        }
        debug {
            // Debug builds are signed with a debug key by default.
            isMinifyEnabled = false
        }
    }

    // Configure Java version compatibility.
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }
    
    // For Kotlin projects, you would configure Kotlin options here.
    // kotlinOptions {
    //     jvmTarget = "1.8"
    // }

    // Explicitly define source sets instead of using `all-java-files-under`.
    // This gives you better control. The default location is `src/main/java`.
    sourceSets {
        getByName("main") {
            java.srcDirs("src/main/java") // Default path
        }
    }
}

// Dependencies for the app are declared here.
// This is the modern way to include libraries like AppCompat, Material Design, etc.
dependencies {
    // Example: implementation("androidx.appcompat:appcompat:1.6.1")
    // Example: implementation("com.google.android.material:material:1.10.0")
}
