//
//  SignLabel.swift
//  ParkingSign
//
//  Created by Ky Pichratanak on 21/5/18.
//  Copyright © 2018 Ky Pichratanak. All rights reserved.
//

import UIKit

class SignLabel: UILabel {
    //MARK:- Public Properties
    var fontSize: CGFloat = 14.0 {
        didSet {
            self.font = UIFont(name: self.customFont!.fontName, size: fontSize)
        }
    }
    
    //MARK:- Private properties
    fileprivate let greenColor = SignColor.greenColor
    fileprivate let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14)
    
    //MARK:- init func
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setCustomProperties()
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        self.setCustomProperties()
    }
    
    //MARK:- Private func
    fileprivate func setCustomProperties() {
        self.textColor = self.greenColor
        self.font = self.customFont
        self.textAlignment = .center
        self.baselineAdjustment = .alignBaselines
        self.lineBreakMode = .byTruncatingTail
        self.numberOfLines = 1
    }
}
