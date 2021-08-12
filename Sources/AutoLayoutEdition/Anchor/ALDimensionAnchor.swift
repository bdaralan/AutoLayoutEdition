import UIKit


public struct ALDimensionAnchor: ALAnchor {
    
    public let type: ALDimensionAnchorType
    
    public let item: ALLayoutItem
    
    public var constraint: NSLayoutConstraint? { store.constraint }
    
    private let store = Store()
    
    private class Store {
        var constraint: NSLayoutConstraint?
        var constant: CGFloat?
    }
    
    private func activateConstraint(_ constraint: NSLayoutConstraint) {
        item.enableAutoLayout()
        store.constraint?.isActive = false
        store.constraint = constraint
        store.constraint?.isActive = true
        
        let isConstantConstraint = constraint.secondItem == nil
        store.constant = isConstantConstraint ? constraint.constant : nil
    }
}


extension ALDimensionAnchor {
    
    @discardableResult
    public func equalTo(_ anchor: Self) -> Self {
        let anchor1 = item.layoutAnchor(for: type)
        let anchor2 = anchor.item.layoutAnchor(for: anchor.type)
        let constraint = anchor1.constraint(equalTo: anchor2)
        activateConstraint(constraint)
        return self
    }
    
    @discardableResult
    public func lessOrEqualTo(_ anchor: Self) -> Self {
        let anchor1 = item.layoutAnchor(for: type)
        let anchor2 = anchor.item.layoutAnchor(for: anchor.type)
        let constraint = anchor1.constraint(lessThanOrEqualTo: anchor2)
        activateConstraint(constraint)
        return self
    }
    
    @discardableResult
    public func greaterOrEqualTo(_ anchor: Self) -> Self {
        let anchor1 = item.layoutAnchor(for: type)
        let anchor2 = anchor.item.layoutAnchor(for: anchor.type)
        let constraint = anchor1.constraint(greaterThanOrEqualTo: anchor2)
        activateConstraint(constraint)
        return self
    }
    
    @discardableResult
    public func equalTo(_ constant: CGFloat) -> Self {
        let anchor = item.layoutAnchor(for: type)
        let constraint = anchor.constraint(equalToConstant: constant)
        activateConstraint(constraint)
        return self
    }
    
    @discardableResult
    public func lessOrEqualTo(_ constant: CGFloat) -> Self {
        let anchor = item.layoutAnchor(for: type)
        let constraint = anchor.constraint(lessThanOrEqualToConstant: constant)
        activateConstraint(constraint)
        return self
    }
    
    @discardableResult
    public func greaterOrEqualTo(_ constant: CGFloat) -> Self {
        let anchor = item.layoutAnchor(for: type)
        let constraint = anchor.constraint(greaterThanOrEqualToConstant: constant)
        activateConstraint(constraint)
        return self
    }
    
    @discardableResult
    public func multiplier(_ multiplier: CGFloat) -> Self {
        guard let constraint = store.constraint else { return self }
        guard let view1 = constraint.firstItem, let view2 = constraint.secondItem else { return self }
        let attribute1 = constraint.firstAttribute
        let attribute2 = constraint.secondAttribute
        let relation = constraint.relation
        let constant = constraint.constant
        let newConstraint = NSLayoutConstraint(
            item: view1, attribute: attribute1, relatedBy: relation,
            toItem: view2, attribute: attribute2, multiplier: multiplier, constant: constant
        )
        activateConstraint(newConstraint)
        return self
    }
    
    @discardableResult
    public func adding(_ adding: CGFloat) -> Self {
        guard let constraint = store.constraint else { return self }
        let constant = store.constant ?? 0
        constraint.constant = constant + adding
        return self
    }
    
    @discardableResult
    public func subtracting(_ subtracting: CGFloat) -> Self {
        adding(-subtracting)
    }
    
    @discardableResult
    public func hugging(_ priority: ALAnchorPriority) -> Self {
        item.setHuggingPriority(priority, for: type)
        return self
    }
    
    @discardableResult
    public func uncompressing(_ priority: ALAnchorPriority) -> Self {
        item.setUncompressingPriority(priority, for: type)
        return self
    }
}


extension ALDimensionAnchor {
    
    @discardableResult
    public func equalTo(_ view: UIView) -> Self {
        equalTo(view.anchorItem.anchor(for: type))
    }
    
    @discardableResult
    public func lessOrEqualTo(_ view: UIView) -> Self {
        lessOrEqualTo(view.anchorItem.anchor(for: type))
    }
    
    @discardableResult
    public func greaterOrEqualTo(_ view: UIView) -> Self {
        greaterOrEqualTo(view.anchorItem.anchor(for: type))
    }
}


extension ALDimensionAnchor {
    
    @discardableResult
    public func equalTo(_ guide: UILayoutGuide) -> Self {
        equalTo(guide.anchorItem.anchor(for: type))
    }
    
    @discardableResult
    public func lessOrEqualTo(_ guide: UILayoutGuide) -> Self {
        lessOrEqualTo(guide.anchorItem.anchor(for: type))
    }
    
    @discardableResult
    public func greaterOrEqualTo(_ guide: UILayoutGuide) -> Self {
        greaterOrEqualTo(guide.anchorItem.anchor(for: type))
    }
}
