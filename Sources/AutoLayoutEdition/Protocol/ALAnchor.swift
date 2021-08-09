import UIKit


protocol ALAnchor {
    
    var item: ALLayoutItem { get }
    
    var constraint: NSLayoutConstraint? { get }
}


extension ALAnchor {
    
    /// The anchor active state.
    public var isActive: Bool {
        get { constraint?.isActive ?? false }
        nonmutating set { constraint?.isActive = newValue }
    }
    
    /// Set anchor priority.
    @discardableResult
    public func priority(_ priority: Float) -> Self {
        constraint?.priority = .init(priority)
        return self
    }
    
    /// Set anchor priority.
    @discardableResult
    public func priority(_ priority: ALAnchorPriority) -> Self {
        constraint?.priority = .init(priority.value)
        return self
    }
}
