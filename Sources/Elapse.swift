import Foundation

public struct Elapse {

    public struct Units: OptionSet {
        public let rawValue: UInt8
        public init(rawValue: UInt8) { self.rawValue = rawValue }
        
        public static let millisecond = Units(rawValue: 1 << 0)
        public static let second      = Units(rawValue: 1 << 1)
        public static let minute      = Units(rawValue: 1 << 2)
        public static let hour        = Units(rawValue: 1 << 3)
        public static let day         = Units(rawValue: 1 << 4)
        
        public static let secondAndMillisecond: Units = [.second, .millisecond]
        public static let minuteAndSecond: Units = [.minute, .second]
        public static let hourAndMinute: Units = [.hour, .minute]
        public static let all: Units = [.day, .hour, .minute, second, millisecond]
        
        var highest: Units {
            if self.contains(.day) {
                return .day
            }else if self.contains(.hour) {
                return .hour
            } else if self.contains(.minute) {
                return .minute
            } else if self.contains(.second) {
                return .second
            } else if self.contains(.millisecond) {
                return .millisecond
            } else {
                return []
            }
        }
        
        var lowest: Units {
            if self.contains(.millisecond) {
                return .millisecond
            } else if self.contains(.second) {
                return .second
            } else if self.contains(.minute) {
                return .minute
            } else if self.contains(.hour) {
                return .hour
            } else if self.contains(.day) {
                return .day
            } else {
                return []
            }
        }
    }
    
    public enum Metric: TimeInterval {
        case millisecond = 0.001
        case second      = 1
        case minute      = 60
        case hour        = 3600
        case day         = 86400
        
        func convert(_ t: TimeInterval) -> Int64 {
            return Int64(t/self.rawValue)
        }
        
        func convert(_ v: Int64) -> TimeInterval {
            return TimeInterval(v) * self.rawValue
        }
    }
    
    public enum RoundingMode {
        case floor, ceiling, halfAwayFromZero
        
        func round(_ time: TimeInterval, metric: Metric) -> TimeInterval {
            let rounded: Int64 = {() -> Int64 in
                switch self {
                case .floor:
                    return Int64((time / metric.rawValue).rounded(.towardZero))
                case .ceiling:
                    return Int64((time / metric.rawValue).rounded(.awayFromZero))
                case .halfAwayFromZero:
                    return Int64((time / metric.rawValue).rounded(.toNearestOrAwayFromZero))
                }
            }()
            return TimeInterval(rounded) * metric.rawValue
        }
    }
    
    public typealias Components = (days: Int64, hours: Int64, minutes: Int64, seconds: Int64, milliseconds: Int64)
}

public extension Int {
    public var days: TimeInterval {
        return Elapse.Metric.day.convert(Int64(self))
    }
    
    public var hours: TimeInterval {
        return Elapse.Metric.hour.convert(Int64(self))
    }
    
    public var minutes: TimeInterval {
        return Elapse.Metric.minute.convert(Int64(self))
    }
    
    public var seconds: TimeInterval {
        return Elapse.Metric.second.convert(Int64(self))
    }
    
    public var milliseconds: TimeInterval {
        return Elapse.Metric.millisecond.convert(Int64(self))
    }

}

public extension TimeInterval {
    
    public func components(of units: Elapse.Units,
                           roundingMode: Elapse.RoundingMode = .floor) -> Elapse.Components {
        let time = { (time: TimeInterval) -> TimeInterval in
            if units.lowest == .day {
                return roundingMode.round(time, metric: .day)
            }else if units.lowest == .hour {
                return roundingMode.round(time, metric: .hour)
            } else if units.lowest == .minute {
                return roundingMode.round(time, metric: .minute)
            } else if units.lowest == .second {
                return roundingMode.round(time, metric: .second)
            } else {
                return roundingMode.round(time, metric: .millisecond)
            }
        }(self)
            
        let convert = {(time: TimeInterval, metric: Elapse.Metric) -> Int64 in
            return metric.convert(time)
        }
        
        let days: Int64 = {
            return units.contains(.day) ? convert(time, .day) : 0
        }()
        
        let hours: Int64 = {
            let t = units.contains(.hour) ? convert(time, .hour) : 0
            return (units.highest == .hour) ? t : t % 24
        }()
        
        let minutes: Int64 = {
            let t = units.contains(.minute) ? convert(time, .minute) : 0
            return (units.highest == .minute) ? t : t % 60
        }()
        
        let seconds: Int64 = {
            let t = units.contains(.second) ? convert(time, .second) : 0
            return (units.highest == .second) ? t : t % 60
        }()
        
        let milliseconds: Int64 = {
            let t = units.contains(.millisecond) ? convert(time, .millisecond) : 0
            return (units.highest == .millisecond) ? t : t % 1000
        }()
        
        return (days: days,
                hours: hours,
                minutes: minutes,
                seconds: seconds,
                milliseconds: milliseconds)
    }
}

