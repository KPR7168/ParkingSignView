//
//  DayComponent.swift
//  ParkingSign
//
//  Created by Ky Pichratanak on 21/5/18.
//  Copyright © 2018 Ky Pichratanak. All rights reserved.
//

import Foundation

public enum DurationUnit: String {
    case hour = "P"
    case minute = "min"
}

public enum DayOfWeek: String {
    case monday     = "MON"
    case tuesday    = "TUE"
    case wednesday  = "WED"
    case thursday   = "THU"
    case friday     = "FRI"
    case saturday   = "SAT"
    case sunday     = "SUN"
}

public enum WeekDay: Int {
    case Sunday     = 1
    case Monday     = 2
    case Tuesday    = 3
    case Wednesday  = 4
    case Thursday   = 5
    case Friday     = 6
    case Saturday   = 7
}

enum Meridiem: String {
    case am = "am"
    case pm = "pm"
}

struct DayComponent {
    var hour: Int
    var minute: Int
    var meridiem: Meridiem
    var day: DayOfWeek
}

public struct DayComponents {
    public var fromDay: DateComponents
    public var toDay: DateComponents
    public var hideDate: Bool = false
    
    public init(fromDay: DateComponents, toDay: DateComponents) {
        self.fromDay = fromDay
        self.toDay = toDay
    }
}

public extension Int {
    public var dayOfWeek: DayOfWeek {
        get {
            switch self {
            case 1:
                return .sunday
            case 2:
                return .monday
            case 3:
                return .tuesday
            case 4:
                return .wednesday
            case 5:
                return .thursday
            case 6:
                return .friday
            case 7:
                return .saturday
            default:
                return (self/7).dayOfWeek
            }
        }
    }
}
