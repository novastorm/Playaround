//
//  LongestCommonSubstringTests.swift
//  PlayaroundTests
//
//  Created by Adland Lee on 11/26/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import XCTest
@testable import Playaround

class LongestCommonSubstringTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testEmptyStrings() {
        XCTAssert(Algorithms.lcs("", "") == "")
    }
    
    func testSet0() {
        let s1 = "ABCD"
        let s2 = "AFKD"
        let result = "AD"
        XCTAssert(Algorithms.lcs(s1, s2) == result)
        let formattedResult = (
            lcs: "AD",
            deleted: "A<span class=\"deleted\">BC</span>D",
            added: "A<span class=\"added\">FK</span>D"
        )
        XCTAssert(Algorithms.textDiff(s1, s2) == formattedResult)
    }
    
    func testSet1() {
        let s1 = "I am waiting for snow."
        let s2 = "I've been waiting for snow."
        let result = "I  waiting for snow."
        XCTAssert(Algorithms.lcs(s1, s2) == result)
        let formattedResult = (
            lcs: "I  waiting for snow.",
            deleted: "I <span class=\"deleted\">am</span> waiting for snow.",
            added: "I<span class=\"added\">\'ve</span> <span class=\"added\">been</span> waiting for snow."
        )
        XCTAssert(Algorithms.textDiff(s1, s2) == formattedResult)
    }
    
    func testSet2() {
        let s1 = "breakfast I had tooday was awsome."
        let s2 = "the breakfast I had today was awesome"
        let result = "breakfast I had today was awsome"
        XCTAssert(Algorithms.lcs(s1, s2) == result)
        let formattedResult = (
            lcs: "breakfast I had today was awsome",
            deleted: "breakfast I had to<span class=\"deleted\">o</span>day was awsome",
            added: "<span class=\"added\">the </span>breakfast I had today was aw<span class=\"added\">e</span>some"
        )
        XCTAssert(Algorithms.textDiff(s1, s2) == formattedResult)
    }
}
