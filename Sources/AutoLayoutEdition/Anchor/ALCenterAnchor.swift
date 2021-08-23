import UIKit


public struct ALCenterAnchor: ALAnchor {
    
    public let type = ALCenterAnchorType()
    
    public let relation: ALAnchorRelation
    
    public let item: ALLayoutItem
    
    public let store: ALLayoutStore
    
    @discardableResult
    public func priority(_ priority: Float) -> ALCenterAnchor {
        store.constraint(for: .centerX, relation: relation)?.priority = .init(priority)
        store.constraint(for: .centerY, relation: relation)?.priority = .init(priority)
        return self
    }
    
    @discardableResult
    public func priority(_ priority: ALAnchorPriority) -> ALCenterAnchor {
        store.constraint(for: .centerX, relation: relation)?.priority = .init(priority.value)
        store.constraint(for: .centerY, relation: relation)?.priority = .init(priority.value)
        return self
    }
}


extension ALCenterAnchor {
    
    func equalTo(_ item: ALLayoutItem) -> Self {
        let centerX = self.item.anchor(for: .centerX).constraint(equalTo: item.anchor(for: .centerX))
        let centerY = self.item.anchor(for: .centerY).constraint(equalTo: item.anchor(for: .centerY))
        store.activateConstraint(centerX, type: .centerX, relation: .equalTo)
        store.activateConstraint(centerY, type: .centerY, relation: .equalTo)
        return .init(relation: .equalTo, item: item, store: store)
    }
    
    func lessOrEqualTo(_ item: ALLayoutItem) -> Self {
        let centerX = self.item.anchor(for: .centerX).constraint(lessThanOrEqualTo: item.anchor(for: .centerX))
        let centerY = self.item.anchor(for: .centerY).constraint(lessThanOrEqualTo: item.anchor(for: .centerY))
        store.activateConstraint(centerX, type: .centerX, relation: .lessOrEqualTo)
        store.activateConstraint(centerY, type: .centerY, relation: .lessOrEqualTo)
        return .init(relation: .lessOrEqualTo, item: item, store: store)
    }
    
    func greaterOrEqualTo(_ item: ALLayoutItem) -> Self {
        let centerX = self.item.anchor(for: .centerX).constraint(greaterThanOrEqualTo: item.anchor(for: .centerX))
        let centerY = self.item.anchor(for: .centerY).constraint(greaterThanOrEqualTo: item.anchor(for: .centerY))
        store.activateConstraint(centerX, type: .centerX, relation: .greaterOrEqualTo)
        store.activateConstraint(centerY, type: .centerY, relation: .greaterOrEqualTo)
        return .init(relation: .greaterOrEqualTo, item: item, store: store)
    }
    
    @discardableResult
    public func padding(x: CGFloat, y: CGFloat) -> Self {
        ALXAxisAnchor(type: .centerX, relation: relation, item: item, store: store).padding(x)
        ALYAxisAnchor(type: .centerY, relation: relation, item: item, store: store).padding(y)
        return self
    }
}


extension ALCenterAnchor {
    
    @discardableResult
    public func equalTo(_ view: UIView) -> Self {
        equalTo(view.anchorItem)
    }
    
    @discardableResult
    public func lessOrEqualTo(_ view: UIView) -> Self {
        lessOrEqualTo(view.anchorItem)
    }
    
    @discardableResult
    public func greaterOrEqualTo(_ view: UIView) -> Self {
        greaterOrEqualTo(view.anchorItem)
    }
}


extension ALCenterAnchor {
    
    @discardableResult
    public func equalTo(_ guide: UILayoutGuide) -> Self {
        equalTo(guide.anchorItem)
    }
    
    @discardableResult
    public func lessOrEqualTo(_ guide: UILayoutGuide) -> Self {
        lessOrEqualTo(guide.anchorItem)
    }
    
    @discardableResult
    public func greaterOrEqualTo(_ guide: UILayoutGuide) -> Self {
        greaterOrEqualTo(guide.anchorItem)
    }
}


extension ALCenterAnchor {
    
    /// The anchor that already been set with the `equalTo` relation.
    ///
    /// Use this when needed to update the anchor without having to setup the relation again.
    public var equalTo: Self {
        .init(relation: .equalTo, item: item, store: store)
    }
    
    /// The anchor that already been set with the `lessOrEqualTo` relation.
    ///
    /// Use this when needed to update the anchor without having to setup the relation again.
    public var lessOrEqualTo: Self {
        .init(relation: .lessOrEqualTo, item: item, store: store)
    }
    
    /// The anchor that already been set with the `greaterOrEqualTo` relation.
    ///
    /// Use this when needed to update the anchor without having to setup the relation again.
    public var greaterOrEqualTo: Self {
        .init(relation: .greaterOrEqualTo, item: item, store: store)
    }
}
