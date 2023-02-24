//
//  NoUpdaterTests.swift
//
//
//  Created by Gabriel Mazzei on 23/02/2023.
//

@testable import GildedRose
import XCTest

final class EmptyUpdaterTests: XCTestCase {
        
    func testUpdater() {
        let item = Item(name: "item", sellIn: 10, quality: 10)
        let stepUpdater = EmptyUpdater(item: item)
        stepUpdater.updateItem()
        
        XCTAssertEqual(item.sellIn, 10)
        XCTAssertEqual(item.quality, 10)
    }
}
