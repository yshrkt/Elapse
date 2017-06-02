import XCTest
@testable import Elapse

class ElapseTests: XCTestCase {
    func testDays() {
        let time: TimeInterval = 3.days
        
        XCTAssertEqual(time, 3 * 24 * 60 * 60)
        XCTAssertEqual(time.components(of: .day).days, 3)
        XCTAssertEqual(time.components(of: .hour).days, 0)
        XCTAssertEqual(time.components(of: .hour).hours, 3 * 24)
        XCTAssertEqual(time.components(of: .minute).minutes, 3 * 24 * 60)
        XCTAssertEqual(time.components(of: .second).seconds, 3 * 24 * 60 * 60)
        XCTAssertEqual(time.components(of: .millisecond).milliseconds, 3 * 24 * 60 * 60 * 1000)
    }
    
    func testHours() {
        let time: TimeInterval = 3.hours
        
        XCTAssertEqual(time, 3 * 60 * 60)
        XCTAssertEqual(time.components(of: .day).days, 0)
        XCTAssertEqual(time.components(of: .day).hours, 0)
        XCTAssertEqual(time.components(of: .hour).hours, 3)
        XCTAssertEqual(time.components(of: .minute).minutes, 3 * 60)
        XCTAssertEqual(time.components(of: .second).seconds, 3 * 60 * 60)
        XCTAssertEqual(time.components(of: .millisecond).milliseconds, 3 * 60 * 60 * 1000)
    }
    
    func testMimutes() {
        let time: TimeInterval = 3.minutes
        
        XCTAssertEqual(time, 3 * 60)
        XCTAssertEqual(time.components(of: .day).days, 0)
        XCTAssertEqual(time.components(of: .day).hours, 0)
        XCTAssertEqual(time.components(of: .day).minutes, 0)
        XCTAssertEqual(time.components(of: .hour).hours, 0)
        XCTAssertEqual(time.components(of: .hour).minutes, 0)
        XCTAssertEqual(time.components(of: .minute).minutes, 3)
        XCTAssertEqual(time.components(of: .second).seconds, 3 * 60)
        XCTAssertEqual(time.components(of: .millisecond).milliseconds, 3 * 60 * 1000)
    }

    func testSeconds() {
        let time: TimeInterval = 3.seconds
        
        XCTAssertEqual(time, 3)
        XCTAssertEqual(time.components(of: .day).days, 0)
        XCTAssertEqual(time.components(of: .day).hours, 0)
        XCTAssertEqual(time.components(of: .day).minutes, 0)
        XCTAssertEqual(time.components(of: .day).seconds, 0)
        XCTAssertEqual(time.components(of: .hour).hours, 0)
        XCTAssertEqual(time.components(of: .hour).minutes, 0)
        XCTAssertEqual(time.components(of: .hour).seconds, 0)
        XCTAssertEqual(time.components(of: .minute).minutes, 0)
        XCTAssertEqual(time.components(of: .minute).seconds, 0)
        XCTAssertEqual(time.components(of: .second).seconds, 3)
        XCTAssertEqual(time.components(of: .millisecond).milliseconds, 3 * 1000)
    }
    
    func testMilliseconds() {
        let time: TimeInterval = 3.milliseconds
        
        XCTAssertEqual(time, 0.003)
        XCTAssertEqual(time.components(of: .day).days, 0)
        XCTAssertEqual(time.components(of: .day).hours, 0)
        XCTAssertEqual(time.components(of: .day).minutes, 0)
        XCTAssertEqual(time.components(of: .day).seconds, 0)
        XCTAssertEqual(time.components(of: .day).milliseconds, 0)
        XCTAssertEqual(time.components(of: .hour).hours, 0)
        XCTAssertEqual(time.components(of: .hour).minutes, 0)
        XCTAssertEqual(time.components(of: .hour).seconds, 0)
        XCTAssertEqual(time.components(of: .hour).milliseconds, 0)
        XCTAssertEqual(time.components(of: .minute).minutes, 0)
        XCTAssertEqual(time.components(of: .minute).seconds, 0)
        XCTAssertEqual(time.components(of: .minute).milliseconds, 0)
        XCTAssertEqual(time.components(of: .second).seconds, 0)
        XCTAssertEqual(time.components(of: .second).milliseconds, 0)
        XCTAssertEqual(time.components(of: .millisecond).milliseconds, 3)
    }
    
    func testHoursAndMinutes() {
        let time: TimeInterval = 3.hours + 3.minutes
        
        XCTAssertEqual(time.components(of: .hourAndMinute).days, 0)
        XCTAssertEqual(time.components(of: .hourAndMinute).hours, 3)
        XCTAssertEqual(time.components(of: .hourAndMinute).minutes, 3)
        XCTAssertEqual(time.components(of: .hourAndMinute).seconds, 0)
        XCTAssertEqual(time.components(of: .hourAndMinute).milliseconds, 0)
        
        XCTAssertEqual(time.components(of: .minuteAndSecond).days, 0)
        XCTAssertEqual(time.components(of: .minuteAndSecond).hours, 0)
        XCTAssertEqual(time.components(of: .minuteAndSecond).minutes, 3 * 60 + 3)
        XCTAssertEqual(time.components(of: .minuteAndSecond).seconds, 0)
        XCTAssertEqual(time.components(of: .minuteAndSecond).milliseconds, 0)
    }
    
    func testMimutesAndSeconds() {
        let time: TimeInterval = 3.minutes + 3.seconds
        
        XCTAssertEqual(time.components(of: .minuteAndSecond).days, 0)
        XCTAssertEqual(time.components(of: .minuteAndSecond).hours, 0)
        XCTAssertEqual(time.components(of: .minuteAndSecond).minutes, 3)
        XCTAssertEqual(time.components(of: .minuteAndSecond).seconds, 3)
        XCTAssertEqual(time.components(of: .minuteAndSecond).milliseconds, 0)
        
        XCTAssertEqual(time.components(of: .secondAndMillisecond).days, 0)
        XCTAssertEqual(time.components(of: .secondAndMillisecond).hours, 0)
        XCTAssertEqual(time.components(of: .secondAndMillisecond).minutes, 0)
        XCTAssertEqual(time.components(of: .secondAndMillisecond).seconds, 3 * 60 + 3)
        XCTAssertEqual(time.components(of: .secondAndMillisecond).milliseconds, 0)
    }
    
    func testSecondsAndMilliseconds() {
        let time: TimeInterval = 3.seconds + 3.milliseconds
        
        XCTAssertEqual(time.components(of: .secondAndMillisecond).days, 0)
        XCTAssertEqual(time.components(of: .secondAndMillisecond).hours, 0)
        XCTAssertEqual(time.components(of: .secondAndMillisecond).minutes, 0)
        XCTAssertEqual(time.components(of: .secondAndMillisecond).seconds, 3)
        XCTAssertEqual(time.components(of: .secondAndMillisecond).milliseconds, 3)
    }
    
    func testCeiling() {
        let time: TimeInterval = 3.days + 3.hours + 3.minutes + 3.seconds + 3.milliseconds
        
        XCTAssertEqual(time.components(of: .day, roundingMode: .ceiling).days, 4)
        let h: Int64 = 3 * 24 + 3
        XCTAssertEqual(time.components(of: .hour, roundingMode: .ceiling).hours, h + Int64(1))
        let m: Int64 = h * 60 + 3
        XCTAssertEqual(time.components(of: .minute, roundingMode: .ceiling).minutes, m + Int64(1))
        let s: Int64 = m * 60 + 3
        XCTAssertEqual(time.components(of: .second, roundingMode: .ceiling).seconds, s + Int64(1))
    }
    
    func testHalfAwayFromZero() {
        let time1: TimeInterval = 3.days + 11.hours + 29.minutes + 29.seconds + 499.milliseconds
        
        XCTAssertEqual(time1.components(of: .day, roundingMode: .halfAwayFromZero).days, 3)
        let h1: Int64 = 3 * 24 + 11
        XCTAssertEqual(time1.components(of: .hour, roundingMode: .halfAwayFromZero).hours, h1)
        let m1: Int64 = h1 * 60 + 29
        XCTAssertEqual(time1.components(of: .minute, roundingMode: .halfAwayFromZero).minutes, m1)
        let s1: Int64 = m1 * 60 + 29
        XCTAssertEqual(time1.components(of: .second, roundingMode: .halfAwayFromZero).seconds, s1)
        
        
        let time2: TimeInterval = 3.days + 12.hours + 30.minutes + 30.seconds + 500.milliseconds
        
        XCTAssertEqual(time2.components(of: .day, roundingMode: .halfAwayFromZero).days, 4)
        let h2: Int64 = 3 * 24 + 12
        XCTAssertEqual(time2.components(of: .hour, roundingMode: .halfAwayFromZero).hours, h2 + Int64(1))
        let m2: Int64 = h2 * 60 + 30
        XCTAssertEqual(time2.components(of: .minute, roundingMode: .halfAwayFromZero).minutes, m2 + Int64(1))
        let s2: Int64 = m2 * 60 + 30
        XCTAssertEqual(time2.components(of: .second, roundingMode: .halfAwayFromZero).seconds, s2 + Int64(1))
    }
    
    
    static var allTests = [
        ("testDays", testDays),
        ("testHours", testHours),
        ("testMimutes", testMimutes),
        ("testSeconds", testSeconds),
        ("testMilliseconds", testMilliseconds),
        ("testHoursAndMinutes", testHoursAndMinutes),
        ("testMimutesAndSeconds", testMimutesAndSeconds),
        ("testSecondsAndMilliseconds", testSecondsAndMilliseconds),
        ("testCeiling", testCeiling),
        ("testHalfAwayFromZero", testHalfAwayFromZero)
    ]
}
