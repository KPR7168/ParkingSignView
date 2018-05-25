//
//  Animation.swift
//  ParkingSignView
//
//  Created by Ky Pichratanak on 25/5/18.
//

import Foundation

public extension UIView {
    
    /**
        This function will animation anything within the block
     */
    public static func animate(_ animateBlock: @escaping () -> Void) {
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 1,
                       options: [],
                       animations: { animateBlock() }, completion: nil)
    }
}
