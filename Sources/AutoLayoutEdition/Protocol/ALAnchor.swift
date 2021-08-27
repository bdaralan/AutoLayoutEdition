import Foundation


/// An anchor that can layout constraint.
///
public protocol ALAnchor {
    
    associatedtype AnchorType: ALAnchorType
    
    /// The anchor type.
    var type: AnchorType { get }
    
    /// The anchor relation.
    var relation: ALAnchorRelation { get }
    
    /// The anchor layout item.
    ///
    /// The item that can provide layout anchor.
    var item: ALLayoutItem { get }
    
    /// The store object that can activate and store constraints.
    var store: ALLayoutStore { get }
    
    /// Set anchor priority.
    func priority(_ priority: Float) -> Self
    
    /// Set anchor priority.
    func priority(_ priority: ALAnchorPriority) -> Self
    
    /// Remove anchor.
    func remove()
    
    /// deactivate anchor.
    func deactivate()
    
    /// reactivate anchor.
    func reactivate()
}


extension ALAnchor {
    
    @discardableResult
    public func priority(_ priority: Float) -> Self {
        store.constraint(for: type, relation: relation)?.priority = .init(priority)
        return self
    }
    
    @discardableResult
    public func priority(_ priority: ALAnchorPriority) -> Self {
        store.constraint(for: type, relation: relation)?.priority = .init(priority.value)
        return self
    }
    
    public func remove() {
        store.removeConstraint(for: type, relation: relation)
    }
    
    public func deactivate() {
        store.constraint(for: type, relation: relation)?.isActive = false
    }
    
    public func reactivate() {
        store.constraint(for: type, relation: relation)?.isActive = true
    }
}
