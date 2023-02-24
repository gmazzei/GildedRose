@testable import GildedRose
import XCTest

final class GildedRoseTests: XCTestCase {
    
    // MARK: - Normal Items
    
    func testNormalItemUpdatingQualityBeforeSellInDate() {
        let item = Item(name: "+5 Dexterity Vest", sellIn: 4, quality: 2)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.sellIn, 3)
        XCTAssertEqual(item.quality, 1)
    }
    
    func testNormalItemUpdatingQualityOnSellInDate() {
        let item = Item(name: "+5 Dexterity Vest", sellIn: 0, quality: 10)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.sellIn, -1)
        XCTAssertEqual(item.quality, 8)
    }
    
    func testNormalItemUpdatingQualityAfterSellInDate() {
        let item = Item(name: "+5 Dexterity Vest", sellIn: -1, quality: 10)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.sellIn, -2)
        XCTAssertEqual(item.quality, 8)
    }
    
    func testNormalItemUpdatingMinimumQuality() {
        let item = Item(name: "+5 Dexterity Vest", sellIn: 2, quality: 0)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.sellIn, 1)
        XCTAssertEqual(item.quality, 0)
    }
    
    // MARK: - Sulfura
    
    func testSulfuraUpdatingQualityBeforeSellInDate() {
        let item = Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 4, quality: 80)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.sellIn, 4)
        XCTAssertEqual(item.quality, 80)
    }
    
    func testSulfuraUpdatingQualityOnSellInDate() {
        let item = Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.sellIn, 0)
        XCTAssertEqual(item.quality, 80)
    }
    
    func testSulfuraUpdatingQualityAfterSellInDate() {
        let item = Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.sellIn, -1)
        XCTAssertEqual(item.quality, 80)
    }
    
    // MARK: - Aged Brie
    
    func testAgedBrieUpdatingQualityBeforeSellinDate() {
        let item = Item(name: "Aged Brie", sellIn: 2, quality: 0)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.sellIn, 1)
        XCTAssertEqual(item.quality, 1)
    }
    
    func testAgedBrieUpdatingQualityOnSellInDate() {
        let item = Item(name: "Aged Brie", sellIn: 0, quality: 0)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.sellIn, -1)
        XCTAssertEqual(item.quality, 2)
    }
    
    func testAgedBrieUpdatingQualityAfterSellInDate() {
        let item = Item(name: "Aged Brie", sellIn: -1, quality: 0)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.sellIn, -2)
        XCTAssertEqual(item.quality, 2)
    }
    
    func testAgedBrieUpdatingMaximumQuality() {
        let item = Item(name: "Aged Brie", sellIn: 2, quality: 50)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.sellIn, 1)
        XCTAssertEqual(item.quality, 50)
    }
    
    // MARK: - Backstage Passes
    
    func testBackstagePassesUpdatingQuality15DaysBeforeSellInDate() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 2)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.sellIn, 14)
        XCTAssertEqual(item.quality, 3)
    }
    
    func testBackstagePassesUpdatingQuality10DaysBeforeSellInDate() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 2)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.sellIn, 9)
        XCTAssertEqual(item.quality, 4)
    }
    
    func testBackstagePassesUpdatingQuality5DaysBeforeSellInDate() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 2)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.sellIn, 4)
        XCTAssertEqual(item.quality, 5)
    }
    
    func testBackstagePassesUpdatingQualityOnSellInDate() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 0, quality: 30)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.sellIn, -1)
        XCTAssertEqual(item.quality, 0)
    }
    
    func testBackstagePassesUpdatingQualityAfterSellInDate() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: -1, quality: 0)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.sellIn, -2)
        XCTAssertEqual(item.quality, 0)
    }
    
    func testBackstagePassesUpdatingMaximumQuality() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 2, quality: 50)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.sellIn, 1)
        XCTAssertEqual(item.quality, 50)
    }
    
    // MARK: - Conjured Passes
    
    func testConjuredItemUpdatingQualityBeforeSellInDate() {
        let item = Item(name: "Conjured Mana Cake", sellIn: 4, quality: 2)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.sellIn, 3)
        XCTAssertEqual(item.quality, 0)
    }
    
    func testConjuredItemUpdatingQualityOnSellInDate() {
        let item = Item(name: "Conjured Mana Cake", sellIn: 0, quality: 10)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.sellIn, -1)
        XCTAssertEqual(item.quality, 6)
    }
    
    func testConjuredItemUpdatingQualityAfterSellInDate() {
        let item = Item(name: "Conjured Mana Cake", sellIn: -1, quality: 10)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.sellIn, -2)
        XCTAssertEqual(item.quality, 6)
    }
    
    func testConjuredItemUpdatingMinimumQuality() {
        let item = Item(name: "Conjured Mana Cake", sellIn: 2, quality: 1)
        let app = GildedRose(items: [item])
        app.updateQuality()
        
        XCTAssertEqual(item.sellIn, 1)
        XCTAssertEqual(item.quality, 0)
    }
}
