# bloc_examples

Bloc makes it easy to separate presentation from business logic, making your code fast, easy to test, and reusable.

## Getting Started

You will need to follow the firebase setup docs found [here](https://firebase.google.com/docs/flutter/setup#create_firebase_project).
Once you've downloaded the .json and .plist files run the project.

- [Lab: Bloc library](https://bloclibrary.dev/)

## Resolve multidex error for Android
### - Enable multidex
    Open project/app/build.gradle and add following lines.
    defaultConfig {
        ...

        multiDexEnabled true
    }
    and 
    dependencies {
        implementation 'com.android.support:multidex:1.0.3'
    }
### - Enable Jetifier
    Open project/android/app/gradle.properties and add following lines.
    android.useAndroidX=true
    android.enableJetifier=true
### - Create custom application class
    package your.great.pakage.appname

    import io.flutter.app.FlutterApplication
    import android.content.Context
    import androidx.multidex.MultiDex

    class App : FlutterApplication() {

        override fun attachBaseContext(base: Context) {
            super.attachBaseContext(base)
            MultiDex.install(this)
        }

    }
### - Change the default application file to new
    Open project/android/app/src/main/AndroidManifest.xml
    Change android:name="io.flutter.app.FlutterApplication" to android:name=".App"


