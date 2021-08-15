import UIKit


public struct ALGuideLayoutAnchor: ALLayoutAnchor {
    
    public let item: ALLayoutItem
    
    public let store: ALLayoutStore
    
    init(guide: UILayoutGuide) {
        item = ALGuideLayoutItem(guide: guide)
        store = ALGuideLayoutStore(guide: guide)
    }
}
