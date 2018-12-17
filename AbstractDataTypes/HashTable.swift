//
//  HashTable.swift
//  Playaround
//
//  Created by Adland Lee on 12/7/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import Foundation

public struct HashTable<Key: Hashable, Value> {
    private typealias Element = (key: Key, value: Value)
    private typealias Bucket = [Element]
    private var buckets = [Bucket]()
    
    private(set) public var count = 0
    
    public var capacity: Int {
        return buckets.count
    }
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public init(minimumCapacity: Int = 0) {
        var capacity = 0
        if minimumCapacity > 0 {
            capacity = nextCapacity(after: minimumCapacity)
        }
        buckets = Array<Bucket>(repeating: [], count: capacity)
    }
    
    private func index(for key: Key) -> Int {
        return abs(key.hashValue) % self.capacity
    }
    
    public subscript(key: Key) -> Value? {
        get {
            return value(for: key)
        }
        set {
            if let value = newValue {
                updateValue(value, for: key)
            }
            else {
                removeValue(for: key)
            }
        }
    }
    
    public func value(for key: Key) -> Value? {
        let index = self.index(for: key)
        for element in buckets[index] {
            if element.key == key {
                return element.value
            }
        }
        
        return nil
    }
    
    @discardableResult
    public mutating func updateValue(_ value: Value, for key: Key) -> Value? {
        count += 1
        checkLoad()
        let index = self.index(for: key)
        
        for (i, e) in buckets[index].enumerated() {
            if e.key == key {
                let oldValue = e.value
                buckets[index][i].value = value
                return oldValue
            }
        }
        
        buckets[index].append((key: key, value: value))
        return nil
    }
    
    @discardableResult
    public mutating func removeValue(for key: Key) -> Value? {
        let index = self.index(for: key)
        
        for (i, e) in buckets[index].enumerated() {
            if e.key == key {
                buckets[index].remove(at: i)
                count -= 1
                return e.value
            }
        }
        return nil
    }
    
    public mutating func checkLoad() {
        if count < capacity { return }
        expand()
    }
    
    public mutating func expand() {
        let oldBuckets = buckets
        let newCapacity = nextCapacity(after: capacity)
        buckets = Array<Bucket>(repeating: [], count: newCapacity)
        count = 0
        for bucket in oldBuckets {
            for e in bucket {
                self[e.key] = e.value
            }
        }
    }
    
    public func nextCapacity(after n: Int) -> Int {
        //        return nextPrimeNumber(after: n)
        return next3x2byn(after: n)
    }
    
    public func nextPrimeNumber(after n: Int) -> Int {
        guard n > 1 else { return 2 }
        
        var primeNumbers = [2]
        
        var isPrime: Bool
        var bounds: Int
        let lowerBound = 2 * n
        
        var candidate = 3
        
        while true {
            isPrime = true
            bounds = Int(Double(candidate).squareRoot())
            for existingPrimeNumber in primeNumbers {
                guard existingPrimeNumber <= bounds else { break }
                guard candidate % existingPrimeNumber != 0 else {
                    isPrime = false
                    break
                }
            }
            if isPrime {
                primeNumbers.append(candidate)
                if candidate > lowerBound {
                    break
                }
            }
            candidate += 1
        }
        
        return primeNumbers.last!
    }
    
    public func next3x2byn(after n: Int) -> Int {
        guard n > 0 else { return 1 }
        guard n > 1 else { return 3 }
        
        let normalized = (Float(n) / 3)
        let l2 = log2(normalized)
        let exponent = floor(l2) + 1
        
        return Int(3 * pow(2.0, exponent))
    }
}
