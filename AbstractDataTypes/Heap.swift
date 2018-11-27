//
//  Heap.swift
//  test
//
//  Created by Adland Lee on 11/18/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import Foundation

public protocol HeapProtocol {
    
    associatedtype Element
    
    var isEmpty: Bool { get }
    var count: Int { get }
    var peek: Element? { get }
    
    mutating func enqueue(_ item: Element)
    
    @discardableResult
    mutating func dequeue() -> Element?
    
    mutating func replace(_ item: Element)
    
    mutating func removeAll()
}

public struct Heap<Element> : HeapProtocol {
    
    fileprivate var heap = Array<Element>()
    
    private var hasPriority: (Element, Element) -> Bool
    
    public var isEmpty: Bool {
        return heap.isEmpty
    }
    
    public var count: Int {
        return heap.count
    }
    
    public var peek: Element? {
        return heap.first
    }

    public init(sort: @escaping (Element, Element) -> Bool) {
        hasPriority = sort
    }

    public init(_ items: [Element], sort: @escaping (Element, Element) -> Bool) {
        hasPriority = sort
        for e in items {
            enqueue(e)
        }
    }
    
    public mutating func enqueue(_ item: Element) {
        heap.append(item)
        siftUp(heap.count - 1)
    }
    
    public mutating func enqueue(_ items: [Element]) {
        for e in items {
            enqueue(e)
        }
    }
    
    public mutating func dequeue() -> Element? {
        guard  !heap.isEmpty else {
            return nil
        }
        
        if heap.count == 1 {
            return heap.removeLast()
        }
        
        let item = heap[0]
        heap[0] = heap.removeLast()
        siftDown(0)
        return item
    }
    
    public mutating func removeAll() {
        heap.removeAll()
    }
    
    public mutating func replace(_ item: Element) {
        replace(index: 0, item: item)
    }
    
    mutating func replace(index i: Int, item: Element) {
        guard i < heap.count else { return }
        heap.remove(at: i)
        enqueue(item)
    }
    
    @inline(__always) internal func parentIndex(ofIndex i: Int) -> Int {
        return (i - 1) / 2
    }
    
    internal func leftChildIndex(ofIndex i: Int) -> Int {
        return (2 * i) + 1
    }
    
    internal func rightChildIndex(ofIndex i: Int) -> Int {
        return (2 * i) + 2
    }
    
    /**
     Compare node at index with ancestors and swap according to compare.
     */
    internal mutating func siftUp(_ index: Int) {
        let item = heap[index]
        var walkerIndex = index
        var parentIndex = self.parentIndex(ofIndex: walkerIndex)
        
        while walkerIndex > 0 && hasPriority(item, heap[parentIndex]) {
            heap[walkerIndex] = heap[parentIndex]
            walkerIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: walkerIndex)
        }
        
        heap[walkerIndex] = item
    }
    
    
    /**
     Compare node at index with children and swap according to compare.
     */
    internal mutating func siftDown(from startIndex: Int, to endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(ofIndex: startIndex)
        let rightChildIndex = self.rightChildIndex(ofIndex: startIndex)
        
        var walkerIndex = startIndex
        
        if leftChildIndex < endIndex && hasPriority(heap[leftChildIndex], heap[walkerIndex]) {
            walkerIndex = leftChildIndex
        }
        if rightChildIndex < endIndex && hasPriority(heap[rightChildIndex], heap[walkerIndex]) {
            walkerIndex = rightChildIndex
        }
        
        if walkerIndex == startIndex {
            return
        }
        heap.swapAt(startIndex, walkerIndex)
        siftDown(from: walkerIndex, to: endIndex)
    }
    
    internal mutating func siftDown(_ index: Int) {
        siftDown(from: index, to: heap.count)
    }
}

extension Heap : Equatable where Element : Equatable {
    
    public static func == (lhs: Heap<Element>, rhs: Heap<Element>) -> Bool {
        return lhs.heap == rhs.heap
    }
    static func == (lhs: Array<Element>, rhs: Heap<Element>) -> Bool {
        return lhs == rhs.heap
    }
    static func == (lhs: Heap<Element>, rhs: Array<Element>) -> Bool {
        return lhs.heap == rhs
    }
    
    
    static func != (lhs: Heap<Element>, rhs: Heap<Element>) -> Bool {
        return lhs.heap != rhs.heap
    }
    static func != (lhs: Array<Element>, rhs: Heap<Element>) -> Bool {
        return lhs != rhs.heap
    }
    static func != (lhs: Heap<Element>, rhs: Array<Element>) -> Bool {
        return lhs.heap != rhs
    }
}

extension Heap : CustomStringConvertible where Element : StringProtocol {
    public var description: String {
        let results = heap.reversed().joined(separator: "\n")
        return results
    }
}
