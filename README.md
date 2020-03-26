# LogMoji

[![CI Status](https://img.shields.io/travis/adilanchian/LogMoji.svg?style=flat)](https://travis-ci.org/adilanchian/LogMoji)
[![Version](https://img.shields.io/cocoapods/v/LogMoji.svg?style=flat)](https://cocoapods.org/pods/LogMoji)
[![License](https://img.shields.io/cocoapods/l/LogMoji.svg?style=flat)](https://cocoapods.org/pods/LogMoji)
[![Platform](https://img.shields.io/cocoapods/p/LogMoji.svg?style=flat)](https://cocoapods.org/pods/LogMoji)

![LogMoji log statements being displayed](https://media.giphy.com/media/1wXf2OKTEy532ooEg4/giphy.gif)

## Introduction

LogMoji is here to help you parse through all your verbose log statements with meaningful, custom emojis that stand out! This simple logger has the ability to log to your console, a specified file path, or both! It also has the ability for you to set as many custom states as you would like. Make your log statements easier to read with LogMoji.

## Getting Started

### Installation

LogMoji is available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'LogMoji'
```

### Usage

LogMoji makes it easy for you to get up and running quickly and easily! For basic usage you follow these steps:

```swift
import LogMoji

enum Errors: String, State {
    case success, critical, warning
    
    var emoji: String {
        switch self {
        case .critical: return "🚨"
        case .warning: return "⚠️"
         case .success: return "✅"
        }
    }
    
    var name: String { self.rawValue }
}

// Decide where to log & whether to show a timestamp
LogMoji.logger.logToConsole(true)
LogMoji.logger.setFilePath("Path/To/File.txt")
LogMoji.logger.showTimeStamp(false)

// Start Logging!
LogMoji.logger.logWith(state: Errors.success, message: "I am a successful LogMoji message!")
LogMoji.logger.logWith(state: Errors.warning, message: "I am a warning LogMoji message!")
LogMoji.logger.logWith(state: Errors.critical, message: "I am a CRITICAL LogMoji message!")
```

#### `setStates(Dictionary<String, String>)`

This method will take any number of states you would like to add to your app. Pass in an ID and associate it with the emoji of your choice!

#### `logWith(state: String, message: String)`

This is the main method to actually log anything with LogMoji. Make sure to set your states and settings before using this.

#### `logToConsole(_ value: Bool)`

Decide whether to log state to console.<br>
**_Defaults to true_**

#### `setFilePath(_ path: String?)`

Set a file path of where you would like to output your logs! This has been tested with an absolute path only.<br>
**_Defaults to nil_**

#### `showTimeStamp(_ value: Bool)`

Decide wether you would like a timestamp prepended to your log.<br>
**_Defaults to true_**

#### `defaultState`

If a state cannot be found, the log statement will default to the defualtState emoji. This can be changed if desired.<br>
**_Defaults to ❓_**

#### `changeDefaultState(emoji: String)`

Set the default state emoji in the chance a specified state could not be found.

#### Example Project

To run the example project, clone the repo, and run `pod install` from the Example directory first. This simple application shows you the very basics of LogMoji.

## Author

Alec Dilanchian<br>
[Twitter](https://twitter.com/alec_dilanchian)<br>
[Twitch](https:/.twitch.tv.pixelogicdev)<br>
[Email](mailto:alec.d@pixelogicapps.com)

## License

LogMoji is available under the MIT license. See the LICENSE file for more info.
