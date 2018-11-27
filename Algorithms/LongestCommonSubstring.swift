//
//  LongestCommonSubstring.swift
//  PlayaroundTests
//
//  Created by Adland Lee on 11/26/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import Foundation

extension Algorithms {
    static func lcs(_ s1: String, _ s2: String) -> String {
        var split1: [String]
        var split2: [String]
        split1 = s1.map { String($0) }
        split2 = s2.map { String($0) }
        return lcs(split1, split2).joined()
    }
}

extension Algorithms {
    
    typealias stringList = [String]
    
    static func lcs(_ s1: stringList, _ s2: stringList) -> stringList {
        return longestCommonSubstring(s1, s2)
    }

    static func longestCommonSubstring(_ s1: stringList, _ s2: stringList) -> stringList {
        
        var memo: [[stringList?]] = Array(
            repeating: Array(
                repeating: .none,
                count: s2.count
            ),
            count: s1.count
        )
        
        func helper(_ s1: stringList, _ s2: stringList, _ i1: Int, _ i2: Int, memo: inout [[stringList?]]) -> stringList {
            
            if i1 == s1.count || i2 == s2.count {
                return stringList()
            }
            
            if let aString = memo[i1][i2] {
                return aString
            }
            
            let stringIndex1 = i1
            let stringIndex2 = i2
            let stringAtIndex1 = s1[stringIndex1]
            let stringAtIndex2 = s2[stringIndex2]
            
            if stringAtIndex1 == stringAtIndex2 {
                memo[i1][i2] = [stringAtIndex1] + helper(s1, s2, i1 + 1, i2 + 1, memo: &memo)
                return memo[i1][i2]!
            }
            
            let result1 = helper(s1, s2, i1 + 1, i2    , memo: &memo)
            let result2 = helper(s1, s2, i1    , i2 + 1, memo: &memo)
            
            if result1.count > result2.count {
                memo[i1][i2] = result1
            }
            else {
                memo[i1][i2] = result2
            }
            
            return memo[i1][i2]!
        }
        
        return helper(s1, s2, 0, 0, memo: &memo)
    }
}
