//
//  gcdTests.swift
//  PlayaroundTests
//
//  Created by Adland Lee on 11/30/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import XCTest
@testable import Playaround


class gcdTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        XCTAssertTrue(Algorithms.gcd(52, 39) == 13)
        XCTAssertTrue(Algorithms.gcd(228, 36) == 12)
        XCTAssertTrue(Algorithms.gcd(51357, 3819) == 57)
        XCTAssertTrue(Algorithms.gcd(51357, 3819, style: .recursive) == 57)
    }
}
