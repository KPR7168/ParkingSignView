//
//  HourStackView.swift
//  ParkingSign
//
//  Created by Ky Pichratanak on 21/5/18.
//  Copyright © 2018 Ky Pichratanak. All rights reserved.
//

import UIKit

public class HourStackView: UIStackView {
    //MARK:- Public properties
    var dateComponents: DateComponents! {
        didSet {
            updateUI()
        }
    }
    
    //MARK:- Private properties
    fileprivate var hourLabel: SignLabel!
    fileprivate var minuteLabel: SignLabel!
    fileprivate var meridiemLabel: SignLabel!
    fileprivate var minuteStackView: UIStackView!
    
    //MARK:- init func
    required public init(coder: NSCoder) {
        super.init(coder: coder)
        
        self.createUI()
    }
    
    init(dateComponents: DateComponents) {
        super.init(frame: CGRect.zero)
        self.dateComponents = dateComponents
        self.createUI()
        self.updateUI()
    }
    
    //MARK:- Private properties
    fileprivate func createUI() {
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .fillProportionally
        self.spacing = 0
        self.contentMode = .scaleToFill
        self.backgroundColor = .clear
        
        self.hourLabel = SignLabel(frame: CGRect(origin: CGPoint.zero, size: CGSize.zero))
        self.hourLabel.fontSize = 30
        self.hourLabel.lineBreakMode = .byClipping
        
        self.minuteLabel = SignLabel(frame: CGRect(origin: CGPoint.zero, size: CGSize.zero))
        self.minuteLabel.fontSize = 17
        
        self.meridiemLabel = SignLabel(frame: CGRect(origin: CGPoint.zero, size: CGSize.zero))
        self.meridiemLabel.fontSize = 12
        
        self.minuteStackView = UIStackView(frame: CGRect.zero)
        self.minuteStackView.addArrangedSubview(self.minuteLabel)
        self.minuteStackView.addArrangedSubview(self.meridiemLabel)
        self.minuteStackView.axis = .vertical
        self.minuteStackView.alignment = .leading
        self.minuteStackView.distribution = .fillProportionally
        self.minuteStackView.spacing = -6
        self.minuteStackView.contentMode = .scaleToFill
        self.minuteStackView.backgroundColor = .clear
        self.minuteStackView.autoresizesSubviews = true
        
        self.addArrangedSubview(self.hourLabel)
        self.addArrangedSubview(self.minuteStackView)
    }
    
    fileprivate func updateUI() {
        guard let hour = self.dateComponents.hour else { return }
        guard let minute = self.dateComponents.minute else { return }
        self.hourLabel.text = hour >= 13 ? "\(hour-12)" : "\(hour)"
        self.minuteLabel.text = String(format: "%02i", minute)
        self.meridiemLabel.text = hour >= 13 ? "PM" : "AM"
    }
}
