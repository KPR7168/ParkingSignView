//
//  MinuteStackView.swift
//  ParkingSign
//
//  Created by Ky Pichratanak on 24/5/18.
//  Copyright © 2018 Ky Pichratanak. All rights reserved.
//

import UIKit

public class MinuteStackView: UIStackView {
    //MARK:- Public properties
    var minute: Int = 1 {
        didSet {
            if self.minute <= 0 || self.minute > 59 {
                self.minuteLabel.text = "00"
            }
            else {
                self.minuteLabel.text = "\(self.minute)"
                self.minuteStringLabel.text = self.minute > 1 ? "MINUTES" : "MINUTE"
            }
        }
    }
    var color: UIColor! {
        set {
            self.largePLabel.textColor = newValue
            self.minuteLabel.textColor = newValue
            self.minuteStringLabel.textColor = newValue
        }
        get {
            if self.color == nil {
                return SignColor.greenColor
            }
            else {
                return self.color
            }
        }
    }
    
    //MARK:- Private properties
    fileprivate let largePLabel = SignLabel(frame: CGRect.zero)
    fileprivate var minuteLabel = SignLabel(frame: CGRect.zero)
    fileprivate var minuteStringLabel = SignLabel(frame: CGRect.zero)
    fileprivate var minuteStackView = UIStackView(frame: CGRect.zero)
    
    //MARK:- Class init
    required public init(coder: NSCoder) {
        super.init(coder: coder)
        
        self.createUI()
    }
    
    init(withMinute minute: Int) {
        super.init(frame: CGRect.zero)
        
        self.minute = minute
        self.createUI()
    }
    
    //MARK:- Private func
    fileprivate func createUI() {
        self.largePLabel.text = "P"
        self.largePLabel.fontSize = 60.0
        
        self.minuteLabel.text = "\(self.minute)"
        self.minuteLabel.fontSize = 38
        
        self.minuteStringLabel.text = self.minute > 1 ? "MINUTES" : "MINUTE"
        self.minuteStringLabel.fontSize = 10
        
        self.minuteStackView.addArrangedSubview(self.minuteLabel)
        self.minuteStackView.addArrangedSubview(self.minuteStringLabel)
        self.minuteStackView.axis = .vertical
        self.minuteStackView.alignment = .center
        self.minuteStackView.distribution = .fill
        self.minuteStackView.spacing = -8.0
        self.minuteStackView.contentMode = .scaleToFill
        
        self.addArrangedSubview(self.largePLabel)
        self.addArrangedSubview(self.minuteStackView)
        self.axis = .horizontal
        self.alignment = .center
        self.distribution = .fill
        self.spacing = 0.0
        self.contentMode = .scaleToFill
    }
}
