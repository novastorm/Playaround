//
//  justifiedWordWrap.swift
//  Playaround
//
//  Created by Adland Lee on 12/16/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import Foundation

extension Algorithms {
    static func justifiedWordWrap(inputText: String, width: Int = 80) -> [[String]] {
        
        var results: [[String]] = []
        
        let pageWidth = width
        
        let words = inputText.components(separatedBy: .whitespacesAndNewlines)
        
        var costMatrixMemo: [[Double?]] = Array(
            repeating: Array(
                repeating: .none,
                count: words.count),
            count: words.count)
        
        @discardableResult
        func costMatrix(_ i: Int, _ j: Int) -> Double {
            
            if let r = costMatrixMemo[i][j] {
                return r
            }
            
            var results = Double.infinity
            
            let subWords = words[i...j]
            
            var totalLength = -1
            
            for w in subWords {
                totalLength += w.count + 1
                if totalLength > pageWidth {
                    costMatrixMemo[i][j] = results
                    return results
                }
            }
            
            results = pow(Double(pageWidth - totalLength), 3)
            costMatrixMemo[i][j] = results
            
            return results
        }
        
        let maxIndex = words.count - 1
        var lineCostMemo: [(Double,Int?)?] = Array(repeating: .none, count: words.count)
        lineCostMemo[maxIndex] = (0, maxIndex)
        
        @discardableResult
        func lineCost(_ i: Int) -> (Double,Int?) {
            
            if let r = lineCostMemo[i] {
                return r
            }
            
            let range = (i ... maxIndex)
            let lineCosts = range.compactMap { j -> (Double, Int?) in
                if i == j { return (costMatrix(i, j),j) }
                return (costMatrix(i, j) + lineCost(j).0,j)
            }
            
            let results = lineCosts.min {$0.0 < $1.0}
            
            lineCostMemo[i] = results
            
            return results!
        }
        
        lineCost(0)
        
        var idx = 0
        while idx < words.count {
            let start = idx
            let end = lineCostMemo[idx]!.1!
            
            let subArray = Array(words[start ... end])
            results.append(subArray)
            
            idx = end + 1
        }
        
        return results
    }

}
