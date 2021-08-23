import UIKit


public struct ALYAxisAnchor: ALAnchor {
    
    public let type: ALYAxisAnchorType
    
    public let relation: ALAnchorRelation
    
    public let item: ALLayoutItem
    
    public let store: ALLayoutStore
    
    @discardableResult
    public func priority(_ priority: Float) -> ALYAxisAnchor {
        store.constraint(for: type, relation: relation)?.priority = .init(priority)
        return self
    }
    
    @discardableResult
    public func priority(_ priority: ALAnchorPriority) -> ALYAxisAnchor {
        store.constraint(for: type, relation: relation)?.priority = .init(priority.value)
        return self
    }
}


extension ALYAxisAnchor {
    
    func equalTo(_ anchor: NSLayoutYAxisAnchor) -> Self {
        let constraint = item.anchor(for: type).constraint(equalTo: anchor)
        store.activateConstraint(constraint, type: type, relation: .equalTo)
        return .init(type: type, relation: .equalTo, item: item, store: store)
    }
    
    func lessOrEqualTo(_ anchor: NSLayoutYAxisAnchor) -> Self {
        let constraint = item.anchor(for: type).constraint(lessThanOrEqualTo: anchor)
        store.activateConstraint(constraint, type: type, relation: .lessOrEqualTo)
        return .init(type: type, relation: .lessOrEqualTo, item: item, store: store)
    }
    
    func greaterOrEqualTo(_ anchor: NSLayoutYAxisAnchor) -> Self {
        let constraint = item.anchor(for: type).constraint(greaterThanOrEqualTo: anchor)
        store.activateConstraint(constraint, type: type, relation: .greaterOrEqualTo)
        return .init(type: type, relation: .greaterOrEqualTo, item: item, store: store)
    }
    
    @discardableResult
    public func padding(_ padding: CGFloat) -> Self {
        guard let constraint = store.constraint(for: type, relation: relation) else { return self }
        switch type {
        case .top: constraint.constant = padding
        case .bottom: constraint.constant = -padding
        case .centerY: constraint.constant = padding
        case .firstBaseline: constraint.constant = padding
        case .lastBaseline: constraint.constant = -padding
        }
        return self
    }
}


extension ALYAxisAnchor {
    
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


extension ALYAxisAnchor {
    
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


extension ALYAxisAnchor {
    
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


extension ALYAxisAnchor {
    
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
