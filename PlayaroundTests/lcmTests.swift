//
//  lcmTests.swift
//  PlayaroundTests
//
//  Created by Adland Lee on 11/30/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import XCTest
@testable import Playaround


class lcmTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        XCTAssertTrue(Algorithms.lcm(8, 10) == 40)
        XCTAssertTrue(Algorithms.lcm(2, 60) == 60)
        XCTAssertTrue(Algorithms.lcm(7, 23) == 161)
    }
}
