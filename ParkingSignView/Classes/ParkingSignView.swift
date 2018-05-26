//
//  ParkingSignViewController.swift
//  ParkingSign
//
//  Created by Ky Pichratanak on 22/5/18.
//  Copyright © 2018 Ky Pichratanak. All rights reserved.
//

import UIKit

public class ParkingSignView: UIView {
    public var duration: Int = 1 {
        didSet {
            self.updateDuration()
        }
    }
    
    public var unit: DurationUnit = .hour {
        didSet {
            self.updateDuration()
        }
    }
    public var isFree: Bool = false {
        didSet {
            UIView.animate {
                self.meterLabel.isHidden = self.isFree
                self.mainStackView.layoutIfNeeded()
            }
            
        }
    }
    public var firstParkingPeriod: DayComponents? {
        didSet {
            guard let firstParking = self.firstParkingPeriod else {
                UIView.animate {
                    self.firstPeriodStackView?.alpha = 0.0
                    self.firstPeriodStackView?.isHidden = true
                    
                    self.mainStackView.layoutIfNeeded()
                }
                return
            }
            
            self.firstPeriodStackView?.fromDay = firstParking.fromDay
            self.firstPeriodStackView?.toDay = firstParking.toDay
            self.firstPeriodStackView?.hideDate = firstParking.hideDate
            UIView.animate {
                self.firstPeriodStackView?.alpha = 1.0
                self.firstPeriodStackView?.isHidden = false
                
                self.mainStackView.layoutIfNeeded()
            }
        }
    }
    public var secondParkingPeriod: DayComponents? {
        didSet {
            guard let secondParking = self.secondParkingPeriod else {
                UIView.animate {
                    self.secondPeriodStackView?.alpha = 0.0
                    self.secondPeriodStackView?.isHidden = true
                    
                    self.mainStackView.layoutIfNeeded()
                }
                return
            }
            
            self.secondPeriodStackView?.fromDay = secondParking.fromDay
            self.secondPeriodStackView?.toDay = secondParking.toDay
            self.secondPeriodStackView?.hideDate = secondParking.hideDate
            
            UIView.animate {
                self.secondPeriodStackView?.alpha = 1.0
                self.secondPeriodStackView?.isHidden = false
                
                self.mainStackView.layoutIfNeeded()
            }
        }
    }
    public var color: UIColor! {
        set {
            self.durationLabel.textColor = newValue
            self.meterLabel.textColor = newValue
            self.firstPeriodStackView?.color = newValue
            self.secondPeriodStackView?.color = newValue
            self.minuteStackView.color = newValue
            self.layer.borderColor = newValue.cgColor
        }
        get {
            if self.color == nil {
                return self.durationLabel.textColor
            }
            else {
                return self.color
            }
        }
    }
    public var arrowDirection: ArrowDirection? {
        didSet {
            if let direction = self.arrowDirection {
                UIView.animate {
                    self.arrowSign.type = direction
                    self.arrowSign.alpha = 1.0
                    self.arrowSign.isHidden = false
                }
            }
            else {
                UIView.animate {
                    self.arrowSign.alpha = 0.0
                    self.arrowSign.isHidden = true
                }
            }
        }
    }
    
    fileprivate var durationLabel = SignLabel(frame: CGRect.zero)
    fileprivate var meterLabel = SignLabel(frame: CGRect.zero)
    fileprivate var firstPeriodStackView: PeriodStackView?
    fileprivate var secondPeriodStackView: PeriodStackView?
    fileprivate let minuteStackView = MinuteStackView(withMinute: 30)
    fileprivate var mainStackView = UIStackView(frame: CGRect.zero)
    fileprivate var arrowSign: ParkingArrow!
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public init(duration time: Int, unit: DurationUnit) {
        super.init(frame: CGRect.zero)
        
        self.duration = time
        self.unit = unit
        
        self.createUI()
    }
    
    override public func awakeFromNib() {
        self.createUI()
    }
    
    fileprivate func createUI() {
        self.layer.borderWidth = 2.0
        self.layer.borderColor = self.durationLabel.textColor.cgColor
        self.layer.cornerRadius = 10.0
        self.backgroundColor = .white
        
        self.frame.size = CGSize(width: 120, height: 220)
        self.mainStackView.frame = self.bounds
        
        self.durationLabel.text = "\(self.duration)\(self.unit.rawValue)"
        self.durationLabel.fontSize = 60
        
        self.meterLabel.text = "METER"
        self.meterLabel.fontSize = 20
        
        self.minuteStackView.minute = self.duration
        self.minuteStackView.isHidden = true
        
        var fromDay = DateComponents()
        fromDay.hour = 12
        fromDay.minute = 30
        fromDay.weekday = WeekDay.Monday.rawValue
        
        var toDay = DateComponents()
        toDay.hour = 20
        toDay.minute = 30
        toDay.weekday = WeekDay.Monday.rawValue
        
        self.firstPeriodStackView = PeriodStackView(fromDay: fromDay, to: toDay)
        self.firstPeriodStackView?.isHidden = true
        self.secondPeriodStackView = PeriodStackView(fromDay: fromDay, to: toDay)
        self.secondPeriodStackView?.isHidden = true
        
        self.arrowSign = ParkingArrow(frame: CGRect(origin: CGPoint.zero,
                                               size: CGSize(width: self.frame.width, height: 20)))
        let emptySpace = UIView(frame: CGRect.zero)
        emptySpace.heightAnchor.constraint(equalToConstant: 2).isActive = true
        emptySpace.widthAnchor.constraint(equalToConstant: 120).isActive = true
        emptySpace.backgroundColor = .clear
        
        self.mainStackView.addArrangedSubview(self.durationLabel)
        self.mainStackView.addArrangedSubview(self.minuteStackView)
        self.mainStackView.addArrangedSubview(self.meterLabel)
        self.mainStackView.addArrangedSubview(self.firstPeriodStackView!)
        self.mainStackView.addArrangedSubview(self.secondPeriodStackView!)
        self.mainStackView.addArrangedSubview(self.arrowSign)
        self.mainStackView.addArrangedSubview(emptySpace)
        self.mainStackView.axis = .vertical
        self.mainStackView.alignment = .center
        self.mainStackView.distribution = .fillProportionally
        self.mainStackView.spacing = 4.0
        self.mainStackView.contentMode = .scaleToFill
        self.mainStackView.backgroundColor = .green
        self.mainStackView.clipsToBounds = true
        self.addSubview(self.mainStackView)
        
        self.constraintMainStackToView()
    }
    
    fileprivate func updateDuration() {
        if self.unit == .hour {
            self.durationLabel.text = "\(self.duration)\(self.unit.rawValue)"
                self.durationLabel.isHidden = false
                self.minuteStackView.isHidden = true
        }
        else {
            self.minuteStackView.minute = self.duration
                self.durationLabel.isHidden = true
                self.minuteStackView.isHidden = false
        }
    }
    
    fileprivate func constraintMainStackToView() {
        self.mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self.mainStackView,
                           attribute: NSLayoutAttribute.left,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: NSLayoutAttribute.left,
                           multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(item: self.mainStackView,
                           attribute: NSLayoutAttribute.right,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: NSLayoutAttribute.right,
                           multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(item: self.mainStackView,
                           attribute: NSLayoutAttribute.top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: NSLayoutAttribute.top,
                           multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(item: self.mainStackView,
                           attribute: NSLayoutAttribute.bottom,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: NSLayoutAttribute.bottom,
                           multiplier: 1, constant: 0).isActive = true
    }
}
