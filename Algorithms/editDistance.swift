//
//  editDistance.swift
//  Playaround
//
//  Created by Adland Lee on 11/30/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import Foundation

extension Algorithms {
    static func editDistance(_ s1: String, _ s2: String) -> Int {
        let s1Chars = Array(s1)
        let s2Chars = Array(s2)
        
        var memo = Array(
            repeating: Array(
                repeating: 0,
                count: s2.count + 1),
            count: s1.count + 1
        )
        
        for i in 0 ... s1.count {
            for j in 0 ... s2.count {
                if i == 0 {
                    memo[i][j] = j
                }
                else if j == 0 {
                    memo[i][j] = i
                }
                else if s1Chars[i-1] == s2Chars[j-1] {
                    memo[i][j] = memo[i-1][j-1]
                }
                else {
                    memo[i][j] = 1 + min(memo[i][j-1],
                                         memo[i-1][j],
                                         memo[i-1][j-1]
                    )
                }
            }
        }
        
        return memo[s1.count][s2.count]
    }
}
