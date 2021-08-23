import Foundation


/// An anchor that can layout first and last baseline.
///
public protocol ALLayoutBaselineAnchor {
    
    /// An item that provides layout anchors.
    var item: ALLayoutItem { get }
    
    /// A layout store used to store constraints.
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
