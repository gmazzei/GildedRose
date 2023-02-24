//
//  StepUpdaterTests.swift
//  
//
//  Created by Gabriel Mazzei on 23/02/2023.
//

@testable import GildedRose
import XCTest

final class StepUpdaterTests: XCTestCase {
    
    // MARK: - Positive step
    
    func testPostiveStepUpdaterBeforeSellInDate() {
        let item = Item(name: "item", sellIn: 10, quality: 10)
        let stepUpdater = StepUpdater(item: item, step: 1)
        stepUpdater.updateItem()
        
        XCTAssertEqual(item.sellIn, 9)
        XCTAssertEqual(item.quality, 9)
    }
    
    func testPositiveStepUpdaterOnSellInDate() {
        let item = Item(name: "item", sellIn: 0, quality: 10)
        let stepUpdater = StepUpdater(item: item, step: 1)
        stepUpdater.updateItem()
        
        XCTAssertEqual(item.sellIn, -1)
        XCTAssertEqual(item.quality, 8)
    }
    
    func testPositiveStepUpdaterAfterSellInDateWithNegativeStep() {
        let item = Item(name: "item", sellIn: -1, quality: 10)
        let stepUpdater = StepUpdater(item: item, step: 1)
        stepUpdater.updateItem()
        
        XCTAssertEqual(item.sellIn, -2)
        XCTAssertEqual(item.quality, 8)
    }
    
    // MARK: - Negative step
    
    func testNegativeStepUpdaterBeforeSellInDate() {
        let item = Item(name: "item", sellIn: 10, quality: 10)
        let stepUpdater = StepUpdater(item: item, step: -1)
        stepUpdater.updateItem()
        
        XCTAssertEqual(item.sellIn, 9)
        XCTAssertEqual(item.quality, 11)
    }
    
    func testNegativeStepUpdaterOnSellInDate() {
        let item = Item(name: "item", sellIn: 0, quality: 10)
        let stepUpdater = StepUpdater(item: item, step: -1)
        stepUpdater.updateItem()
        
        XCTAssertEqual(item.sellIn, -1)
        XCTAssertEqual(item.quality, 12)
    }
    
    func testNegativeStepUpdaterAfterSellInDate() {
        let item = Item(name: "item", sellIn: -1, quality: 10)
        let stepUpdater = StepUpdater(item: item, step: -1)
        stepUpdater.updateItem()
        
        XCTAssertEqual(item.sellIn, -2)
        XCTAssertEqual(item.quality, 12)
    }
    
    // MARK: - Multiple step
    
    func testMultipleStepUpdaterBeforeSellInDate() {
        let item = Item(name: "item", sellIn: 10, quality: 10)
        let stepUpdater = StepUpdater(item: item, step: 5)
        stepUpdater.updateItem()
        
        XCTAssertEqual(item.sellIn, 9)
        XCTAssertEqual(item.quality, 5)
    }
    
    func testMultipleStepUpdaterOnSellInDate() {
        let item = Item(name: "item", sellIn: 0, quality: 10)
        let stepUpdater = StepUpdater(item: item, step: 5)
        stepUpdater.updateItem()
        
        XCTAssertEqual(item.sellIn, -1)
        XCTAssertEqual(item.quality, 0)
    }
    
    func testMultipleStepUpdaterAfterSellInDateWithNegativeStep() {
        let item = Item(name: "item", sellIn: -1, quality: 10)
        let stepUpdater = StepUpdater(item: item, step: 5)
        stepUpdater.updateItem()
        
        XCTAssertEqual(item.sellIn, -2)
        XCTAssertEqual(item.quality, 0)
    }
}
