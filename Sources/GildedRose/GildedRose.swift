private struct ItemNames {
    static let agedBrie: String = "aged brie"
    static let sulfuras: String = "sulfuras"
    static let backstagePasses: String = "backstage passes"
    static let conjured: String = "conjured"
}

public class GildedRose {
    var items: [Item]

    public init(items: [Item]) {
        self.items = items
    }

    public func updateQuality() {
        items.forEach { item in
            let updater = fetchUpdater(item: item)
            updater.updateItem()
        }
    }
    
    private func fetchUpdater(item: Item) -> Updater {
        switch item.name.lowercased() {
        case let name where name.contains(ItemNames.agedBrie):
            return InvertedStepUpdater(item: item)
        case let name where name.contains(ItemNames.sulfuras):
            return EmptyUpdater(item: item)
        case let name where name.contains(ItemNames.backstagePasses):
            return BackstagePassesUpdater(item: item)
        case let name where name.contains(ItemNames.conjured):
            return DoubleStepUpdater(item: item)
        default:
            return SimpleStepUpdater(item: item)
        }
    }
}
