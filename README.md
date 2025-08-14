This is a Kotlin Multiplatform project targeting Android, iOS.



# Infiniti News
News app made in Compose Multiplatform with clean architecture using using MVI. This application mostly emphasizes on layered architecture. Not much is done in designs and animations.

## Screens and Sections
- HeadLines
- All News
- News Detail

## Video
|                                Android                                          |                                       iOS                                       | 
|:-------------------------------------------------------------------------------:|:-------------------------------------------------------------------------------:|
| https://github.com/user-attachments/assets/7819fd41-f5b1-4776-ac95-3dc3371ef331 | https://github.com/user-attachments/assets/9067d40c-b116-4148-a325-352d7fabdc7c |


## Installation
### 1. Clone the repo
```bash
git clone https://github.com/Hassaan10/Infiniti-News-Kotlin-MultiPlatform.git
cd Infiniti-News-Kotlin-MultiPlatform
```

### 3. Add your API key into Constants file
API_KEY = 'YOUR_API_KEY';



## Libraries
- For networking I am using ktor
- For dependency injection I am using koin
- coil is used for image loading in Android

## API Key
Get your API key at https://newsapi.org/







* [/composeApp](./composeApp/src) is for code that will be shared across your Compose Multiplatform applications.
  It contains several subfolders:
  - [commonMain](./composeApp/src/commonMain/kotlin) is for code that’s common for all targets.
  - Other folders are for Kotlin code that will be compiled for only the platform indicated in the folder name.
    For example, if you want to use Apple’s CoreCrypto for the iOS part of your Kotlin app,
    the [iosMain](./composeApp/src/iosMain/kotlin) folder would be the right place for such calls.
    Similarly, if you want to edit the Desktop (JVM) specific part, the [jvmMain](./composeApp/src/jvmMain/kotlin)
    folder is the appropriate location.

* [/iosApp](./iosApp/iosApp) contains iOS applications. Even if you’re sharing your UI with Compose Multiplatform,
  you need this entry point for your iOS app. This is also where you should add SwiftUI code for your project.

* [/shared](./shared/src) is for the code that will be shared between all targets in the project.
  The most important subfolder is [commonMain](./shared/src/commonMain/kotlin). If preferred, you can add code to the platform-specific folders here too.


Learn more about [Kotlin Multiplatform](https://www.jetbrains.com/help/kotlin-multiplatform-dev/get-started.html)…
