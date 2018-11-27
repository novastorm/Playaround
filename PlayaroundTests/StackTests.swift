//
//  StackTests.swift
//  StackTests
//
//  Created by Adland Lee on 11/20/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import XCTest
@testable import Playaround

class StackTests: XCTestCase {

    typealias TestType = Int
    var stack: Stack<TestType>?
    
    override func setUp() {
        stack = Stack<TestType>()
    }

    override func tearDown() {
        stack = nil
    }

    func testCreation() {
        guard let stack = stack else {
            XCTFail("Failed to initialize stack")
            return
        }
        XCTAssertTrue(stack.isEmpty, "Test stack should be empty")
        XCTAssert(stack == [TestType](), "Test stack should be an empty array of elements")
    }

    func testPush() {

        guard var stack = stack else {
            XCTFail("Heap not initialized")
            return
        }
        
        let count = 5
        var targetStack = [TestType]()

        for i in 0 ..< count {
            stack.push(i)
            targetStack.append(i)
            if stack != targetStack {
                print(stack)
                print(targetStack)
                XCTFail("Stack should equal target")
            }
        }

        for _ in 0 ..< count {
            if let result = stack.pop(), let target = targetStack.popLast() {
                
                XCTAssert(result == target, "result does nt equal target")
                if result != target {
                    print(stack)
                    print(targetStack)
                    XCTFail("Stack should equal target")
                }
            }
            else {
                XCTFail("pop should return a valid result")
                return
            }
        }
        
        XCTAssertNil(stack.top, "peek on empty stack should return nil")
        XCTAssertNil(stack.pop(), "pop on empty stack should return nil")
    }

//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
