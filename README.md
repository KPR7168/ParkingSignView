# ParkingSignView

[![Version](https://img.shields.io/cocoapods/v/ParkingSignView.svg?style=flat)](https://cocoapods.org/pods/ParkingSignView)
[![License](https://img.shields.io/cocoapods/l/ParkingSignView.svg?style=flat)](https://cocoapods.org/pods/ParkingSignView)
[![Platform](https://img.shields.io/cocoapods/p/ParkingSignView.svg?style=flat)](https://cocoapods.org/pods/ParkingSignView)

ParkingSingView is an iOS swift library which return street parking sign view for Melbourne style. It is extremely flexible and easy to implement.

Hour             |  Minute          |   Two Conditions
:-------------------------:|:-------------------------:|:-------------------------:
<img src="https://raw.githubusercontent.com/KPR7168/ParkingSignView/master/ParkingSignView/Assets/sample1.png" width=100px height=166px>  |  <img src="https://raw.githubusercontent.com/KPR7168/ParkingSignView/master/ParkingSignView/Assets/sample2.png" width=100px height=166px>   | <img src="https://raw.githubusercontent.com/KPR7168/ParkingSignView/master/ParkingSignView/Assets/sample3.png" width=100px height=166px>   

## Features
- [x] Flexible UI
- [x] Customizable
- [x] Easy to use

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

ParkingSignView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ParkingSignView'
```

## How to use
### Initialization
```swift
let signView = ParkingSignView(duration: 1, unit: .hour)
signView.center = self.view.center
self.view.addSubview(signView)
```

### Change parking duration
```swift
signView.duration = 3
```

### Change parking unit
```swift
signView.unit = .hour //For hour format
signView.unit = .minute //For minute format
```

### Show meter label
```swift
signView.isFree = false //false to show, true to hide
```

## Author

KPR7168, pich_ratanak@ymail.com

## License

ParkingSignView is available under the MIT license. See the LICENSE file for more info. 🇰🇭
