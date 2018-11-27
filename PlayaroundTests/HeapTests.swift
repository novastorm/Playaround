//
//  HeapTests.swift
//  HeapTests
//
//  Created by Adland Lee on 11/20/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import XCTest
@testable import Playaround

extension Int : HeapItem {
    public func hasPriorityOver(_ other: Int) -> Bool {
        return self < other
    }
}

class HeapTests: XCTestCase {

    typealias TestType = Int
    var heap: Heap<TestType>?
    
    override func setUp() {
        heap = Heap<TestType>()
    }

    override func tearDown() {
        heap = nil
    }

    func testCreation() {
        guard let heap = heap else {
            XCTFail("Failed to initialize stack")
            return
        }
        XCTAssertTrue(heap.isEmpty, "Test stack should be empty")
        XCTAssert(heap == [TestType](), "Test stack should be an empty array of elements")
    }
    
    func testInsertion() {
        guard var heap = heap else {
            XCTFail("Heap not initialized")
            return
        }
        heap.enqueue(5)
        XCTAssert(heap == [5])
        XCTAssert(heap.peek == 5)
        heap.enqueue(4)
        XCTAssert(heap == [4, 5])
        XCTAssert(heap.peek == 4)
        heap.enqueue(7)
        XCTAssert(heap == [4, 5, 7])
        XCTAssert(heap.peek == 4)
        heap.enqueue(3)
        XCTAssert(heap == [3, 4, 7, 5])
        XCTAssert(heap.peek == 3)
        heap.enqueue(9)
        XCTAssert(heap == [3, 4, 7, 5, 9])
        XCTAssert(heap.peek == 3)
        heap.enqueue(8)
        XCTAssert(heap == [3, 4, 7, 5, 9, 8])
        XCTAssert(heap.peek == 3)
        heap.enqueue(6)
        XCTAssert(heap == [3, 4, 6, 5, 9, 8, 7])
        XCTAssert(heap.peek == 3)
        
        heap.enqueue([10, 11, 12])
        XCTAssert(heap == [3, 4, 6, 5, 9, 8, 7, 10, 11, 12])
    }

//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
