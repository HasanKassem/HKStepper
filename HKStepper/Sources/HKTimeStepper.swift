//
//  HKTimeStepper.swift
//  HKStepper
//
//  Created by Hasan Kassem on 3/12/20.
//  Copyright © 2020 Hasan Kassem. All rights reserved.
//

import UIKit

@IBDesignable
open class HKTimeStepper:  UIControl{
    var view: UIView!
    
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var label: UILabel!
    
    var time = mytime(hours: 0, minutes: 0, is24: false)
    
    ///hours in 24 format
    @IBInspectable public var  hours: Int = 0{
        didSet{
            self.time.hours = hours
            updateValue()
        }
    }
    ///minutes
    @IBInspectable public var  minutes: Int = 0{
        didSet{
            self.time.minutes = minutes
            updateValue()
        }
    }
    ///value added or subtracted in minutes
    ///(ex 65 is 1 hour and 5 minutes)
    @IBInspectable public var stepMinutes: Int = 5
    ///when enabled, time is shown in 24 hour format
    @IBInspectable public var is24: Bool = false{
        didSet{
            time.is24 = is24
            updateValue()
        }
    }
    ///am value
    @IBInspectable public var amText: String = "am"{
        didSet{
            time.am = amText
            updateValue()
        }
    }
    ///pm value
    @IBInspectable public var pmText: String = "pm"{
        didSet{
            time.pm = pmText
            updateValue()
        }
    }
    /// Color of the text
    @IBInspectable public var textColor: UIColor = .darkText {
        didSet {
            label.textColor = textColor
        }
    }
    /// Color of the buttons
    @IBInspectable public var buttonsColor: UIColor = .darkText {
        didSet {
            plus.tintColor = buttonsColor
            minus.tintColor = buttonsColor
        }
    }
    ///set font by name
    @IBInspectable public var fontName:String = "system"{
        didSet{
            label.font = fontName == "system" ? UIFont.systemFont(ofSize: fontSize) : UIFont(name: fontName, size: fontSize)
        }
    }
    ///set font size
    @IBInspectable public var fontSize: CGFloat = 18{
        didSet{
            label.font = fontName == "system" ? UIFont.systemFont(ofSize: fontSize) : UIFont(name: fontName, size: fontSize)
        }
    }
    
    func updateValue(){
        label.text = String(describing: time)
        sendActions(for: .valueChanged)
    }
    func increment(){
        time.increment(val: stepMinutes)
        updateValue()
    }
    func decrement(){
        time.decrement(val: stepMinutes)
        updateValue()
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
    }
    
    func loadViewFromNib() {
        let podBundle = Bundle(for:HKTimeStepper.self)
        if let bundleURL = podBundle.url(forResource: "HKStepper", withExtension: "bundle") {
            if let bundle = Bundle(url: bundleURL) {
                let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
                let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
                view.frame = bounds
                view.autoresizingMask = [
                    UIView.AutoresizingMask.flexibleWidth,
                    UIView.AutoresizingMask.flexibleHeight
                ]
                addSubview(view)
                self.view = view
            }
        }
    }
    
    
    @IBAction func plusAction(_ sender: Any) {
        increment()
    }
    @IBAction func minusAction(_ sender: Any) {
        decrement()
    }
    
    struct mytime: CustomStringConvertible{
        var hours: Int!{
            didSet{
                adjust()
            }
        }
        var minutes: Int!{
            didSet{
                adjust()
            }
        }
        var is24: Bool!
        var am = "am"
        var pm = "pm"
        init(hours: Int = 0, minutes: Int = 0, is24: Bool = true){
            self.hours = hours%24
            self.minutes = minutes%60
            self.is24 = is24
        }
        var description: String{
            if is24{
                return String(format: "%02d:%02d", hours, minutes)
            }
            return String(format: "%02d:%02d %@", hours > 12 ? hours - 12 : hours, minutes, hours >= 12 ? pm : am)
        }
        
        mutating func increment(val: Int){
            self.minutes += val
            adjust()
        }
        mutating func decrement(val: Int){
            self.minutes -= val
            adjust()
        }
        mutating func adjust(){
            if minutes >= 60{
                self.minutes = minutes - 60
                self.hours += 1
                adjust()
            }
            if minutes < 0{
                self.minutes = 60 + minutes
                self.hours -= 1
                adjust()
            }
            if hours >= 24{
                self.hours = hours - 24
                adjust()
            }
            if hours < 0{
                self.hours = hours + 24
                adjust()
            }
        }
    }
    
}
