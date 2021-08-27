import UIKit


public struct ALDimensionAnchor: ALAnchor {
    
    public let type: ALDimensionAnchorType
    
    public let relation: ALAnchorRelation
    
    public let item: ALLayoutItem
    
    public let store: ALLayoutStore
}


extension ALDimensionAnchor {
    
    private func equalTo(_ anchor: NSLayoutDimension) -> Self {
        let constraint = item.anchor(for: type).constraint(equalTo: anchor)
        store.addConstraint(constraint, type: type, relation: .equalTo)
        return .init(type: type, relation: .equalTo, item: item, store: store)
    }
    
    private func lessOrEqualTo(_ anchor: NSLayoutDimension) -> Self {
        let constraint = item.anchor(for: type).constraint(lessThanOrEqualTo: anchor)
        store.addConstraint(constraint, type: type, relation: .lessOrEqualTo)
        return .init(type: type, relation: .lessOrEqualTo, item: item, store: store)
    }
    
    private func greaterOrEqualTo(_ anchor: NSLayoutDimension) -> Self {
        let constraint = item.anchor(for: type).constraint(greaterThanOrEqualTo: anchor)
        store.addConstraint(constraint, type: type, relation: .greaterOrEqualTo)
        return .init(type: type, relation: .greaterOrEqualTo, item: item, store: store)
    }
    
    @discardableResult
    public func equalTo(_ constant: CGFloat) -> Self {
        let constraint = item.anchor(for: type).constraint(equalToConstant: constant)
        store.addConstraint(constraint, type: type, relation: .equalTo)
        return .init(type: type, relation: .equalTo, item: item, store: store)
    }
    
    @discardableResult
    public func lessOrEqualTo(_ constant: CGFloat) -> Self {
        let constraint = item.anchor(for: type).constraint(lessThanOrEqualToConstant: constant)
        store.addConstraint(constraint, type: type, relation: .lessOrEqualTo)
        return .init(type: type, relation: .lessOrEqualTo, item: item, store: store)
    }
    
    @discardableResult
    public func greaterOrEqualTo(_ constant: CGFloat) -> Self {
        let constraint = item.anchor(for: type).constraint(greaterThanOrEqualToConstant: constant)
        store.addConstraint(constraint, type: type, relation: .greaterOrEqualTo)
        return .init(type: type, relation: .greaterOrEqualTo, item: item, store: store)
    }
    
    @discardableResult
    public func multiplier(_ multiplier: CGFloat) -> Self {
        guard let constraint = store.constraint(for: type, relation: relation) else { return self }
        guard let item1 = constraint.firstItem, let item2 = constraint.secondItem else { return self }
        let attribute1 = constraint.firstAttribute
        let attribute2 = constraint.secondAttribute
        let newConstraint = NSLayoutConstraint(
            item: item1, attribute: attribute1, relatedBy: constraint.relation,
            toItem: item2, attribute: attribute2, multiplier: multiplier, constant: constraint.constant
        )
        store.addConstraint(newConstraint, type: type, relation: relation)
        return self
    }
    
    @discardableResult
    public func adding(_ adding: CGFloat) -> Self {
        guard let constraint = store.constraint(for: type, relation: relation) else { return self }
        let constant = store.constant(for: type, relation: relation) ?? 0
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
    public func equalTo(_ anchor: Self) -> Self {
        equalTo(anchor.item.anchor(for: anchor.type))
    }
    
    @discardableResult
    public func lessOrEqualTo(_ anchor: Self) -> Self {
        lessOrEqualTo(anchor.item.anchor(for: anchor.type))
    }
    
    @discardableResult
    public func greaterOrEqualTo(_ anchor: Self) -> Self {
        greaterOrEqualTo(anchor.item.anchor(for: anchor.type))
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


extension ALDimensionAnchor {
    
    /// The anchor that already been set with the `equalTo` relation.
    ///
    /// Use this when needed to update the anchor without having to setup the relation again.
    public var equalTo: Self {
        .init(type: type, relation: .equalTo, item: item, store: store)
    }
    
    /// The anchor that already been set with the `lessOrEqualTo` relation.
    ///
    /// Use this when needed to update the anchor without having to setup the relation again.
    public var lessOrEqualTo: Self {
        .init(type: type, relation: .lessOrEqualTo, item: item, store: store)
    }
    
    /// The anchor that already been set with the `greaterOrEqualTo` relation.
    ///
    /// Use this when needed to update the anchor without having to setup the relation again.
    public var greaterOrEqualTo: Self {
        .init(type: type, relation: .greaterOrEqualTo, item: item, store: store)
    }
}
