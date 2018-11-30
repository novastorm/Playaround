//
//  greatestCommonDenominator.swift
//  Playaround
//
//  Created by Adland Lee on 11/30/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import Foundation

extension Algorithms {
    enum GCDHelperStyle {
        case iterative, recursive
    }
    
    static func gcd(_ a: Int, _ b: Int, style: GCDHelperStyle = .iterative) -> Int {
        return greatestCommonDenominator(a, b)
    }
    
    static func greatestCommonDenominator(_ a: Int, _ b: Int, style: GCDHelperStyle = .iterative) -> Int {
        func recursiveHelper(_ a: Int, _ b: Int) -> Int {
            let r = a % b
            if r != 0 {
                return recursiveHelper(b, r)
            }
            else {
                return b
            }
        }
        
        func iterativeHelper(_ a: Int, _ b: Int) -> Int {
            var m = 0
            var n = max(a, b)
            var r = min(a, b)
            
            while r != 0 {
                m = n
                n = r
                r = m % n
            }
            
            return n
        }
        
        switch style {
        case .iterative:
            return recursiveHelper(a, b)
        case .recursive:
            return iterativeHelper(a, b)
        }
    }
}
