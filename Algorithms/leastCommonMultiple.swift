//
//  leastCommonMultiple.swift
//  Playaround
//
//  Created by Adland Lee on 11/30/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import Foundation

extension Algorithms {
    static func lcm(_ a: Int, _ b: Int) -> Int {
        return leastCommonMultiple(a, b)
    }
    
    static func leastCommonMultiple(_ a: Int, _ b: Int) -> Int {
        return a / gcd(a, b) * b
    }
}
