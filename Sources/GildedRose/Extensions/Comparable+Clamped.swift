//
//  Comparable+Clamped.swift
//  
//
//  Created by Gabriel Mazzei on 23/02/2023.
//

import Foundation

extension Comparable {
    func clamped(to limits: ClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}
