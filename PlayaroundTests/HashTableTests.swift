//
//  HashTableTests.swift
//  PlayaroundTests
//
//  Created by Adland Lee on 12/8/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import XCTest
@testable import Playaround


class HashTableTests: XCTestCase {

    func testExample() {

        var hashTable = HashTable<String, Any>(minimumCapacity: 0)
        var lastCapacity = hashTable.capacity
        print("I ->", lastCapacity)

        for i in 0 ... 200 {
            hashTable[String(i)] = i
            if hashTable.capacity != lastCapacity {
                lastCapacity = hashTable.capacity
                print(i, "->", hashTable.capacity)
            }
        }
        
        var dict = [AnyHashable: Any]()
        lastCapacity = dict.capacity
        print("I -> ", lastCapacity)

        for i in 0 ... 1000000 {
            dict[i] = i
            if dict.capacity != lastCapacity {
                lastCapacity = dict.capacity
                print(i, "->", lastCapacity)
            }
        }
    }
}
