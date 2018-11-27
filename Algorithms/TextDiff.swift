//
//  TextDiff.swift
//  Playaround
//
//  Created by Adland Lee on 11/26/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import Foundation

extension Algorithms {
    static func textDiff(_ s1: String, _ s2: String, splitByWords: Bool = false) -> ( lcs: String, deleted: String, added: String) {
        
        func pushResult(_ resultArray: inout [String], _ stringToPush: String, className: String? = nil) {
            guard !stringToPush.isEmpty else {
                return
            }
            
            if let className = className {
                resultArray.append("<span class=\"\(className)\">\(stringToPush)</span>")
            }
            else {
                resultArray.append(stringToPush)
            }
        }
        
        var split1: [String]
        var split2: [String]
        var lcs: [String]
        
        if splitByWords {
            let separators = CharacterSet(charactersIn: " .,")
            split1 = s1.components(separatedBy: separators)
            split2 = s2.components(separatedBy: separators)
            lcs = Algorithms.lcs(split1, split2)
        }
        else {
            split1 = s1.map { String($0) }
            split2 = s2.map { String($0) }
            lcs = Algorithms.lcs(split1, split2)
        }
        
        var i1 = 0, i1Next = 0
        var i2 = 0, i2Next = 0
        var result1 = [String]()
        var result2 = [String]()
        
        for i in 0 ..< lcs.count {
            i1Next = split1.suffix(from: i1).firstIndex(of: lcs[i])!
            i2Next = split2.suffix(from: i2).firstIndex(of: lcs[i])!
            pushResult(&result1, split1[i1 ..< i1Next].joined(), className: "deleted")
            pushResult(&result2, split2[i2 ..< i2Next].joined(), className: "added")
            pushResult(&result1, lcs[i])
            pushResult(&result2, lcs[i])
            
            i1 = i1Next + 1
            i2 = i2Next + 1
        }
        
        return (
            lcs: lcs.joined(),
            deleted: result1.joined(),
            added: result2.joined()
        )
    }
}

