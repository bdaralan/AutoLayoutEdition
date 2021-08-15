import Foundation


public protocol ALLayoutBaselineAnchor {
    
    var item: ALLayoutItem { get }
    
    var store: ALLayoutStore { get }
}


extension ALLayoutBaselineAnchor {
    
    /// The first baseline anchor.
    public var firstBaseline: ALYAxisAnchor {
        .init(type: .firstBaseline, relation: .none, item: item, store: store)
    }
    
    /// The last baseline anchor.
    public var lastBaseline: ALYAxisAnchor {
        .init(type: .lastBaseline, relation: .none, item: item, store: store)
    }
}
