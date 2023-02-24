//
//  BackstagePassesUpdater.swift
//  
//
//  Created by Gabriel Mazzei on 23/02/2023.
//

import Foundation

struct BackstagePassesUpdater: Updater {
    private let item: Item
    
    init(item: Item) {
        self.item = item
    }
    
    func updateItem() {
        item.sellIn = item.sellIn - 1
        let quality: Int
        
        switch item.sellIn {
        case let days where days >= 10:
            quality = item.quality + 1
        case 5...9:
            quality = item.quality + 2
        case 0...4:
            quality = item.quality + 3
        default:
            quality = 0
        }
        
        item.quality = min(quality, 50)
    }
}
