//
//  primeNumbersTest.swift
//  PlayaroundTests
//
//  Created by Adland Lee on 11/27/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import XCTest
@testable import Playaround


extension Int {
    var factors: [Int] {
        return (2...self).filter { self % $0 == 0 }
    }
    
    var isPrime: Bool {
        if self == 1 {
            return true
        }
        
        var upper = Int(Double(self).squareRoot())
        if upper < self {
            upper = self
        }
        
        let range = 2 ... upper
        return range.filter({ self % $0 == 0 }).count == 1
    }
}

class primeNumbersTest: XCTestCase {

    func test7() {
        let target = 7
        print(Algorithms.primeNumbers(upTo: target))
        XCTAssert(Algorithms.primeNumbers(upTo: target).map{$0.isPrime}.filter({$0 == false}).isEmpty)
    }

    func test10() {
        let target = 10
        print(Algorithms.primeNumbers(upTo: target))
        XCTAssert(Algorithms.primeNumbers(upTo: target).map{$0.isPrime}.filter({$0 == false}).isEmpty)
    }

    func test100() {
        let target = 100
        print(Algorithms.primeNumbers(upTo: target))
        XCTAssert(Algorithms.primeNumbers(upTo: target).map{$0.isPrime}.filter({$0 == false}).isEmpty)
    }

}
