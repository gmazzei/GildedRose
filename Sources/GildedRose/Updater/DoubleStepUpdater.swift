//
//  DoubleStepUpdater.swift
//  
//
//  Created by Gabriel Mazzei on 23/02/2023.
//

import Foundation

final class DoubleStepUpdater: StepUpdater {
    
    init(item: Item) {
        super.init(item: item, step: 2)
    }
}
