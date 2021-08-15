import UIKit


public struct ALViewLayoutAnchor: ALLayoutAnchor, ALLayoutBaselineAnchor {
    
    public let item: ALLayoutItem
    
    public let store: ALLayoutStore
    
    init(view: UIView) {
        item = ALViewLayoutItem(view: view)
        store = ALViewLayoutStore(view: view)
    }
}
