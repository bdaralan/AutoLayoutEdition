import UIKit


public protocol ALAnchor {
    
    associatedtype AnchorType: ALAnchorType
    
    /// The anchor type.
    var type: AnchorType { get }
    
    /// The anchor relation.
    var relation: ALAnchorRelation { get }
    
    /// The anchor layout item.
    ///
    /// The item that can provide `leadingAnchor`, `centerXAnchor`, or `widthAnchor`.
    var item: ALLayoutItem { get }
    
    /// The store object that activate and store constraints.
    var store: ALLayoutStore { get }
    
    /// Set anchor priority.
    func priority(_ priority: Float) -> Self
    
    /// Set anchor priority.
    func priority(_ priority: ALAnchorPriority) -> Self
}
