//
//  ArrowSign.swift
//  ParkingSign
//
//  Created by Ky Pichratanak on 26/5/18.
//  Copyright © 2018 Ky Pichratanak. All rights reserved.
//

import UIKit

public enum ArrowDirection {
    case left
    case right
    case both
}

public class ParkingArrow: UIView {
    
    var type: ArrowDirection = .both {
        didSet {
            self.updateUI()
        }
    }
    fileprivate var arrowSize: CGFloat {
        return self.bounds.width / 12
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.updateUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.updateUI()
    }
    
    fileprivate func updateUI() {
        
        self.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        self.heightAnchor.constraint(equalToConstant: self.frame.height).isActive = true
        
        self.layer.sublayers?.removeAll()
        
        switch self.type {
        case .both:
            self.layer.addSublayer(self.createArrow(type: .left))
            self.layer.addSublayer(self.arrowBody())
            self.layer.addSublayer(self.createArrow(type: .right))
            break
        case .left:
            self.layer.addSublayer(self.createArrow(type: .left))
            self.layer.addSublayer(self.arrowBody())
            break
        case .right:
            self.layer.addSublayer(self.createArrow(type: .right))
            self.layer.addSublayer(self.arrowBody())
            break
        }
    }
    
    fileprivate func createArrow(type: ArrowDirection) -> CAShapeLayer {
        let marginTop = CGFloat(2.0)
        //Left arrow
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.arrowSize, y: marginTop))
        path.addLine(to: CGPoint(x: 0.0, y: self.bounds.height / marginTop))
        path.addLine(to: CGPoint(x: self.arrowSize, y: self.bounds.height - 1))
        path.close()
        
        var layer = self.shapeLayer(withPath: path)
        layer.position = CGPoint(x: self.arrowSize, y: 0.0)
        
        if type == .right {
            let mirrorPath = CGAffineTransform(scaleX: -1.0, y: 1.0)
            path.apply(mirrorPath)
            layer = self.shapeLayer(withPath: path)
            layer.position = CGPoint(x: self.bounds.width - self.arrowSize, y: 0.0)
        }
        
        return layer
    }
    
    fileprivate func arrowBody() -> CAShapeLayer {
        let bodyHeight = CGFloat(3.0)
        let margin = (self.arrowSize * 2) - 2
        
        //Arrow body
        let path = UIBezierPath()
        path.move(to: CGPoint(x: margin, y: self.bounds.height / bodyHeight))
        path.addLine(to: CGPoint(x: margin, y: (self.bounds.height - (self.bounds.height / bodyHeight))))
        path.addLine(to: CGPoint(x: self.bounds.width - margin, y: (self.bounds.height - (self.bounds.height / bodyHeight))))
        path.addLine(to: CGPoint(x: self.bounds.width - margin, y: (self.bounds.height / bodyHeight)))
        path.close()
        
        return self.shapeLayer(withPath: path)
    }
    
    fileprivate func shapeLayer(withPath: UIBezierPath) -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = withPath.cgPath
        shapeLayer.fillColor = SignColor.greenColor.cgColor
        return shapeLayer
    }
}
