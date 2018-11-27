//
//  Stack.swift
//  Playaround
//
//  Created by Adland Lee on 11/24/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import Foundation

public protocol StackProtocol {
    
    associatedtype Element
    
    var isEmpty: Bool { get }
    var count: Int { get }
    var top: Element? { get }

    mutating func push(_ item: Element)
    
    @discardableResult
    mutating func pop() -> Element?
    
    mutating func removeAll()
}

struct Stack<Element> : StackProtocol {
    
    fileprivate var stack = [Element]()
    
    public var isEmpty: Bool {
        return stack.isEmpty
    }
    
    public var count: Int {
        return stack.count
    }
    
    public var top: Element? {
        return stack.last
    }

    init() {}
    
    init(_ items: [Element]) {
        for e in items {
            push(e)
        }
    }
    
    mutating public func push(_ item: Element) {
        stack.append(item)
    }
    
    public mutating func pop() -> Element? {
        return stack.popLast()
    }
    
    public mutating func removeAll() {
        stack.removeAll()
    }
}

extension Stack : Equatable where Element : Equatable {
    
    static func == (lhs: Stack<Element>, rhs: Stack<Element>) -> Bool {
        return lhs.stack == rhs.stack
    }
    static func == (lhs: Array<Element>, rhs: Stack<Element>) -> Bool {
        return lhs == rhs.stack
    }
    static func == (lhs: Stack<Element>, rhs: Array<Element>) -> Bool {
        return lhs.stack == rhs
    }

    
    static func != (lhs: Stack<Element>, rhs: Stack<Element>) -> Bool {
        return lhs.stack != rhs.stack
    }
    static func != (lhs: Array<Element>, rhs: Stack<Element>) -> Bool {
        return lhs != rhs.stack
    }
    static func != (lhs: Stack<Element>, rhs: Array<Element>) -> Bool {
        return lhs.stack != rhs
    }
}

extension Stack : CustomStringConvertible where Element : StringProtocol {
    var description: String {
        let results = stack.reversed().joined(separator: "\n")
        return results
    }
}
