//
//  SimpleStepUpdater.swift
//  
//
//  Created by Gabriel Mazzei on 23/02/2023.
//

import Foundation

final class SimpleStepUpdater: StepUpdater {
    
    init(item: Item) {
        super.init(item: item, step: 1)
    }
}
