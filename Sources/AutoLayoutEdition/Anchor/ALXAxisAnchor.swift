import UIKit


public struct ALXAxisAnchor: ALAnchor {
    
    public let type: ALXAxisAnchorType
    
    public let relation: ALAnchorRelation
    
    public let item: ALLayoutItem
    
    public let store: ALLayoutStore
}


extension ALXAxisAnchor {
    
    private func equalTo(_ anchor: NSLayoutXAxisAnchor) -> Self {
        let constraint = item.anchor(for: type).constraint(equalTo: anchor)
        store.addConstraint(constraint, type: type, relation: .equalTo)
        return .init(type: type, relation: .equalTo, item: item, store: store)
    }
    
    private func lessOrEqualTo(_ anchor: NSLayoutXAxisAnchor) -> Self {
        let constraint = item.anchor(for: type).constraint(lessThanOrEqualTo: anchor)
        store.addConstraint(constraint, type: type, relation: .lessOrEqualTo)
        return .init(type: type, relation: .lessOrEqualTo, item: item, store: store)
    }
    
    private func greaterOrEqualTo(_ anchor: NSLayoutXAxisAnchor) -> Self {
        let constraint = item.anchor(for: type).constraint(greaterThanOrEqualTo: anchor)
        store.addConstraint(constraint, type: type, relation: .greaterOrEqualTo)
        return .init(type: type, relation: .greaterOrEqualTo, item: item, store: store)
    }
    
    @discardableResult
    public func padding(_ padding: CGFloat) -> Self {
        guard let constraint = store.constraint(for: type, relation: relation) else { return self }
        switch type {
        case .leading: constraint.constant = padding
        case .trailing: constraint.constant = -padding
        case .centerX: constraint.constant = padding
        }
        return self
    }
}


extension ALXAxisAnchor {
    
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


extension ALXAxisAnchor {
    
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


extension ALXAxisAnchor {
    
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


extension ALXAxisAnchor {
    
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
