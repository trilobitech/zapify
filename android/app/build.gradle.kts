import com.google.firebase.perf.plugin.FirebasePerfExtension
import java.io.FileInputStream
import java.util.*

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")

    id("com.google.gms.google-services")
    id("com.google.firebase.firebase-perf")
    id("com.google.firebase.crashlytics")
}

val secretsProperties = Properties()
    .apply {
        val secretsPropertiesFile = rootProject.file("secrets.properties")
            .takeIf { it.exists() } ?: rootProject.file("secrets.defaults.properties")
        load(FileInputStream(secretsPropertiesFile))
    }

val isFirebaseDistribution = System.getenv("IS_FIREBASE_DISTRIBUTION") == "true"

android {
    namespace = "com.trilobitech.zapify"

    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973" // flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.zapfy.app"

        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion

        versionCode = flutter.versionCode
        versionName = flutter.versionName

        manifestPlaceholders["ADS_APP_ID"] =
            System.getenv("ANDROID_ADS_APP_ID") ?: secretsProperties.getProperty("ads.appId")
    }

    signingConfigs {
        create("release") {
            storeFile = file(
                System.getenv("ANDROID_KEYSTORE_PATH") ?: secretsProperties.getProperty("keystore.path")
                    .replaceFirst("~", System.getenv("HOME"))
            )
            storePassword =
                System.getenv("ANDROID_KEYSTORE_PASSWORD") ?: secretsProperties.getProperty("keystore.password")
            keyAlias = System.getenv("ANDROID_KEYSTORE_KEY_ALIAS") ?: secretsProperties.getProperty("keystore.keyAlias")
            keyPassword =
                System.getenv("ANDROID_KEYSTORE_KEY_PASSWORD") ?: secretsProperties.getProperty("keystore.keyPassword")
        }
    }

    buildTypes {
        getByName("debug") {
            configure<FirebasePerfExtension> {
                setInstrumentationEnabled(false)
            }
            applicationIdSuffix = ".dev"
            signingConfig = signingConfigs.getByName("debug")
        }

        getByName("release") {
            applicationIdSuffix = if (isFirebaseDistribution) ".dev" else ""
            signingConfig = signingConfigs.getByName("release")
        }
    }

    sourceSets {
        getByName("debug") {
            res.srcDirs("src/dev/res")
        }
        getByName("release") {
            if (isFirebaseDistribution) {
                res.srcDirs("src/dev/res")
            }
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation(platform("com.google.firebase:firebase-bom:33.14.0"))
    implementation("com.google.firebase:firebase-analytics")

    val multidexVersion = "2.0.1"
    implementation("androidx.multidex:multidex:$multidexVersion")
    "coreLibraryDesugaring"("com.android.tools:desugar_jdk_libs:2.1.5")
}
