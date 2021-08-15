import UIKit


public protocol ALLayoutItem {
    
    func anchor(for type: ALXAxisAnchorType) -> NSLayoutXAxisAnchor
    
    func anchor(for type: ALYAxisAnchorType) -> NSLayoutYAxisAnchor
    
    func anchor(for type: ALDimensionAnchorType) -> NSLayoutDimension
    
    func setHuggingPriority(_ priority: ALAnchorPriority, for type: ALDimensionAnchorType)
    
    func setUncompressingPriority(_ priority: ALAnchorPriority, for type: ALDimensionAnchorType)
}
