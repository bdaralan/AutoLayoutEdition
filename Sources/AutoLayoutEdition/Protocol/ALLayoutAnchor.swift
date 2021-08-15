import UIKit


public protocol ALLayoutAnchor {
    
    var item: ALLayoutItem { get }
    
    var store: ALLayoutStore { get }
}


extension ALLayoutAnchor {
    
    /// The top anchor.
    public var top: ALYAxisAnchor {
        .init(type: .top, relation: .none, item: item, store: store)
    }
    /// The bottom anchor.
    public var bottom: ALYAxisAnchor {
        .init(type: .bottom, relation: .none, item: item, store: store)
    }
    
    /// The leading anchor.
    public var leading: ALXAxisAnchor {
        .init(type: .leading, relation: .none, item: item, store: store)
    }
    
    /// The trailing anchor.
    public var trailing: ALXAxisAnchor {
        .init(type: .trailing, relation: .none, item: item, store: store)
    }

    /// The center x anchor.
    public var centerX: ALXAxisAnchor {
        .init(type: .centerX, relation: .none, item: item, store: store)
    }
    
    /// The center y anchor.
    public var centerY: ALYAxisAnchor {
        .init(type: .centerY, relation: .none, item: item, store: store)
    }
    
    /// The width anchor.
    public var width: ALDimensionAnchor {
        .init(type: .width, relation: .none, item: item, store: store)
    }
    
    /// The height anchor.
    public var height: ALDimensionAnchor {
        .init(type: .height, relation: .none, item: item, store: store)
    }
    
    /// The `top`, `bottom`, `leading`, and `trailing` anchors.
    public var edges: ALEdgeAnchor {
        .init(relation: .none, item: item, store: store)
    }
    
    /// The `centerX` and `centerY` anchors.
    public var center: ALCenterAnchor {
        .init(relation: .none, item: item, store: store)
    }
    
    /// The `width` and `height` anchors.
    public var size: ALSizeAnchor {
        .init(relation: .none, item: item, store: store)
    }
}
