//
//  BackstagePassesUpdaterTests.swift
//
//
//  Created by Gabriel Mazzei on 23/02/2023.
//

@testable import GildedRose
import XCTest

final class BackstagePassesUpdaterTests: XCTestCase {
        
    func testUpdaterWith11Days() {
        let item = Item(name: "item", sellIn: 12, quality: 10)
        let stepUpdater = BackstagePassesUpdater(item: item)
        stepUpdater.updateItem()
        
        XCTAssertEqual(item.sellIn, 11)
        XCTAssertEqual(item.quality, 11)
    }
    
    func testUpdaterWith10Days() {
        let item = Item(name: "item", sellIn: 10, quality: 10)
        let stepUpdater = BackstagePassesUpdater(item: item)
        stepUpdater.updateItem()
        
        XCTAssertEqual(item.sellIn, 9)
        XCTAssertEqual(item.quality, 12)
    }
    
    func testUpdaterWith5Days() {
        let item = Item(name: "item", sellIn: 5, quality: 10)
        let stepUpdater = BackstagePassesUpdater(item: item)
        stepUpdater.updateItem()
        
        XCTAssertEqual(item.sellIn, 4)
        XCTAssertEqual(item.quality, 13)
    }
    
    func testUpdaterWithZeroDays() {
        let item = Item(name: "item", sellIn: 0, quality: 10)
        let stepUpdater = BackstagePassesUpdater(item: item)
        stepUpdater.updateItem()
        
        XCTAssertEqual(item.sellIn, -1)
        XCTAssertEqual(item.quality, 0)
    }
}
