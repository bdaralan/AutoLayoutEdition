import UIKit


public protocol ALLayoutItem {
    
    nonmutating func layoutAnchor(for type: ALXAxisAnchorType) -> NSLayoutXAxisAnchor
    
    nonmutating func layoutAnchor(for type: ALYAxisAnchorType) -> NSLayoutYAxisAnchor
    
    nonmutating func layoutAnchor(for type: ALDimensionAnchorType) -> NSLayoutDimension
    
    nonmutating func enableAutoLayout()
    
    nonmutating func setHuggingPriority(_ priority: ALAnchorPriority, for type: ALDimensionAnchorType)
    
    nonmutating func setUncompressingPriority(_ priority: ALAnchorPriority, for type: ALDimensionAnchorType)
}


extension ALLayoutItem {
    
    nonmutating func anchor(for type: ALXAxisAnchorType) -> ALXAxisAnchor {
        .init(type: type, item: self)
    }
    
    nonmutating func anchor(for type: ALYAxisAnchorType) -> ALYAxisAnchor {
        .init(type: type, item: self)
    }
    
    nonmutating func anchor(for type: ALDimensionAnchorType) -> ALDimensionAnchor {
        .init(type: type, item: self)
    }
}
