# Elapse
![Xcode](https://img.shields.io/badge/Xcode-8.3.3-brightgreen.svg)
![Swift](https://img.shields.io/badge/Swift-3.1-brightgreen.svg)
![platforms](https://img.shields.io/badge/platforms-iOS%20%7C%20macOS%20%7C%20tvOS%20%7C%20watchOS-333333.svg)
![Travis CI](https://travis-ci.org/yshrkt/Elapse.svg?branch=master)

Elapse is tiny helper library for manipulating TimeInterval.

## Usage

### Calcurate TimeInterval easily.

```swift
let days: TimeInterval = 3.days // 3 * 24 * 60 * 60
let hours: TimeInterval = 3.hours // 3 * 60 * 60
let minutes: TimeInterval = 3.minutes // 3 * 60
let seconds: TimeInterval = 3.seconds // 3.0
let mills: TimeInterval =  3.milliseconds // 0.003

let time: TimeInterval = 3.days + 3.hours + 3.minutes

```

### Separates TimeInterval to each components easily.
```swift

let input: TimeInterval = 30.minutes + 30.seconds

let output1 = input.components(of: [.minutes, .seconds])
print("\(output1.minutes):\(output1.seconds)") // "3:30"

let output2 = input.components(of: [.minutes])
print("\(output2.minutes)min") // "30min"

// You can also set the rounding mode. the default value is .floor
let output3 = input.components(of: [.minutes], roundingMode: .ceiling)
print("\(output3.minutes)min") // "31min"

let output4 = input.components(of: [.minutes], roundingMode: .halfAwayFromZero)
print("\(output4.minutes)min") // "31min"

let output5 = (input - 1.seconds).components(of: [.minutes], roundingMode: .halfAwayFromZero)
print("\(output5.minutes)min") // "30min"

let output6 = input.components(of: [.hour], roundingMode: .halfAwayFromZero)
print("\(output6.hours)hour") // "1hour"
```

## Requirements

* Xcode 8.3.2
* Swift 3.1

## Installation

### Carthage

To install it, simply add the following line to your `Cartfile`:

```
github "yshrkt/Elapse"
```

### CocoaPods

To install it, simply add the following line to your `Podfile`:

```
pod "Elapse"
```

### Swift Package Manager

To install it, simply add the proper description to your `Package.swift`:

```swift
import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    targets: [],
    dependencies: [
        .Package(url: "https://github.com/yshrkt/Elapse.git"),
    ]
)
```

## Licence

Elapse is released under the MIT license. [See LICENSE](https://github.com/yshrkt/Elapse/blob/master/LICENSE) for details.

## Author

[yshrkt](https://github.com/yshrkt)
