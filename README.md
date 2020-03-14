# HKStepper
![Cocoapods](https://img.shields.io/cocoapods/v/HKStepper)
![Cocoapods platforms](https://img.shields.io/cocoapods/p/HKStepper)
![Cocoapods](https://img.shields.io/cocoapods/l/HKStepper)

![](https://media.giphy.com/media/JNlTJnCfv13h6cSAe3/giphy.gif)
## Description
`HKStepper` concept is similar to Apple's `UIStepper` but with more options. Two steppers are available, `HKTimeStepper`
for selecting time and `HKValueStepper` for selecting integer values. Both display the value in a `UILable` between the buttons.
Many customizations are available too.


## Usage
Drag a `UIView` object and set the class to `HKTimeStepper` or `HKValueStepper`. 
Make sure to set the size of the view so it displays correctly (preferably 190*40). Now you can customize the 
properties in the IB as shown in the figures.
To be notified when the value changes, create an `@IBAction` on `ValueChanged` control event.


![Imgur](https://i.imgur.com/vd9lEmu.png)

![Imgur](https://i.imgur.com/tBFNKKt.png)

## Properties
### HKTimeStepper

```swift
    ///hours in 24 format
    @IBInspectable public var  hours: Int = 0
    
    ///minutes
    @IBInspectable public var  minutes: Int = 0
    
    ///value added or subtracted in minutes
    ///(ex 65 is 1 hour and 5 minutes)
    @IBInspectable public var stepMinutes: Int = 5
    
    ///when enabled, time is shown in 24 hour format
    @IBInspectable public var is24: Bool = false
    
    ///am value
    @IBInspectable public var amText: String = "am"
    
    ///pm value
    @IBInspectable public var pmText: String = "pm"
    
    /// Color of the text
    @IBInspectable public var textColor: UIColor = .darkText
    
    /// Color of the buttons
    @IBInspectable public var buttonsColor: UIColor = .darkText
    
    ///set font by name
    @IBInspectable public var fontName:String = "system"
    
    ///set font size
    @IBInspectable public var fontSize: CGFloat = 18
```

### HKValueStepper

```swift
    ///current value
    @IBInspectable public var value: Int = 0
    
    ///value added or subtracted
    @IBInspectable public var stepValue: Int = 5
    
    ///minimum value
    @IBInspectable public var minValue: Int = 0
    
    ///maximum value
    @IBInspectable public var maxValue: Int = 50
    
    ///text displayed before value
    @IBInspectable public var prefix: String = ""
    
    ///text displayed after value
    @IBInspectable public var postfix: String = ""
    
    /// Color of the text
    @IBInspectable public var textColor: UIColor = .darkText
    
    /// Color of the buttons
    @IBInspectable public var buttonsColor: UIColor = .darkText
    
    ///set font by name
    @IBInspectable public var fontName:String = "system"
    
    ///set font size
    @IBInspectable public var fontSize: CGFloat = 18
```
## Installation
HKStepper is available via CocoaPods. Add the following line to your podfile:
```ruby
pod 'HKStepper'
```


## Author
I'm [Hasan Kassem](https://hasankassem.com). I develop apps for iOS and Android.

Twitter: [@hasankassem_](https://twitter.com/hasankassem_) | Instagram: [@hasankassem_](https://instagram.com/hasankassem_) | Email: [hello@hasankassem.com](mailto:hello@hasankassem.com)  

## Licence

`HKStepper` is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
