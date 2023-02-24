//
//  StepUpdater.swift
//  
//
//  Created by Gabriel Mazzei on 23/02/2023.
//

import Foundation

/// Updater that lowers the quality of an item at a specific pace/step and doubles it after the 'Sell In' date has passed.
class StepUpdater: Updater {
    
    private let item: Item
    private let step: Int
    
    init(item: Item, step: Int) {
        self.item = item
        self.step = step
    }
    
    func updateItem() {
        item.sellIn = item.sellIn - 1
        let quality: Int
        
        if item.sellIn >= 0 {
            quality = item.quality - step
        } else {
            quality = item.quality - step * 2
        }
        
        item.quality = quality.clamped(to: 0...50)
    }
}
