//
//  EmptyUpdater.swift
//  
//
//  Created by Gabriel Mazzei on 23/02/2023.
//

import Foundation

/// Updater that does not change the sell in date nor the item quality.
struct EmptyUpdater: Updater {
    private let item: Item
    
    init(item: Item) {
        self.item = item
    }
    
    func updateItem() {
        // No-op
    }
}
