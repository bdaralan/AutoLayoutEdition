import UIKit


extension UIView {
    
    var anchorItem: ALViewLayoutItem {
        .init(view: self)
    }
    
    /// A layout anchor used to setup constraints.
    ///
    /// - Note:
    ///   - Accessing this value ALWAYS return a new object.
    ///   - Keep a reference to the object when need to modify the same constraints.
    ///   - The object is a value type, but all mutations and constraints are stored in its `store` property.
    ///
    /// - Tag: UIView.anchor
    public var anchor: ALViewLayoutAnchor {
        .init(view: self)
    }
    
    /// A convenience method for setting up constraints in a block.
    public func anchor(_ anchor: (ALViewLayoutAnchor) -> Void) {
        anchor(self.anchor)
    }
}
