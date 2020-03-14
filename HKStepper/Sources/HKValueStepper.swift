//
//  HKValueStepper.swift
//  HKStepper
//
//  Created by Hasan Kassem on 3/14/20.
//  Copyright © 2020 Hasan Kassem. All rights reserved.
//

import UIKit

@IBDesignable
open class HKValueStepper:  UIControl{
    var view: UIView!
    
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var label: UILabel!
    
    ///current value
    @IBInspectable public var value: Int = 0{
        didSet{
            updateValue()
        }
    }
    ///value added or subtracted
    @IBInspectable public var stepValue: Int = 5{
        didSet{
            setState()
        }
    }
    ///minimum value
    @IBInspectable public var minValue: Int = 0{
        didSet{
            setState()
        }
    }
    ///maximum value
    @IBInspectable public var maxValue: Int = 50{
        didSet{
            setState()
        }
    }
    ///text displayed before value
    @IBInspectable public var prefix: String = ""{
        didSet{
            updateValue()
        }
    }
    ///text displayed after value
    @IBInspectable public var postfix: String = ""{
        didSet{
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
            plus.setImage(plus.image(for: .normal)?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate), for: .normal)
            minus.setImage(minus.image(for: .normal)?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate), for: .normal)
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
        label.text = "\(prefix)\(value)\(postfix)"
        sendActions(for: .valueChanged)
        setState()
    }
    func setState(){
        plus.isEnabled = value + stepValue <= maxValue
        minus.isEnabled = value - stepValue >= minValue
    }
    func increment(){
        if(stepValue + value <= maxValue){
            value += stepValue
            updateValue()
        }
    }
    func decrement(){
        if(stepValue + value >= minValue){
            value -= stepValue
            updateValue()
        }
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
    }
    
    override init(frame: CGRect) {
        let defaultFrame = CGRect(x: Double(frame.origin.x), y: Double(frame.origin.y), width: 190.0, height: 40.0)
        super.init(frame: defaultFrame)
        loadViewFromNib()
    }
    
    func loadViewFromNib() {
        // let bundle = Bundle(for: type(of: self))
        let podBundle = Bundle(for:HKValueStepper.self)
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
}

