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
        let range = 2 ... Int(Double(self).squareRoot())
        return range.filter({ self % $0 == 0 }).count == 1
    }
}

class primeNumbersTest: XCTestCase {

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
