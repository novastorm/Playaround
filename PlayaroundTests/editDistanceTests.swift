//
//  editDistanceTests.swift
//  PlayaroundTests
//
//  Created by Adland Lee on 11/30/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import XCTest
@testable import Playaround

class editDistanceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEditDistance() {
        let s1 = "sunday"
        let s2 = "saturday"
        
        XCTAssertTrue(Algorithms.editDistance(s1, s2) == 3)
    }
}
