//
//  primeNumbers.swift
//  Playaround
//
//  Created by Adland Lee on 11/27/18.
//  Copyright © 2018 4MFD. All rights reserved.
//

import Foundation

extension Algorithms {
    static func primeNumbers(upTo n:Int) -> [Int] {
        guard n > 1 else {
            return []
        }
        
        var primeNumbers = [2]
        var isPrime: Bool
        var bounds: Int
        
        for candidate in 3 ... n {
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
            }
        }
        return primeNumbers
    }
}
