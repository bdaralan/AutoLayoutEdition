import UIKit


public struct ALViewLayoutAnchor: ALLayoutAnchor {
    
    public let item: ALLayoutItem
    
    public let store: ALLayoutStore

    init(view: UIView) {
        item = ALViewLayoutItem(view: view)
        store = ALViewLayoutStore(view: view)
    }
}


extension ALViewLayoutAnchor: ALLayoutBaselineAnchor {
    
    public var firstBaseline: ALYAxisAnchor {
        .init(type: .firstBaseline, relation: .none, item: item, store: store)
    }
    
    public var lastBaseline: ALYAxisAnchor {
        .init(type: .lastBaseline, relation: .none, item: item, store: store)
    }
}
