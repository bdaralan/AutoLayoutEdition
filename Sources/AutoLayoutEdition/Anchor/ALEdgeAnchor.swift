import UIKit


public struct ALEdgeAnchor: ALAnchor {
    
    public let type = ALEdgeAnchorType()
    
    public let relation: ALAnchorRelation
    
    public let item: ALLayoutItem
    
    public let store: ALLayoutStore
    
    @discardableResult
    public func priority(_ priority: Float) -> ALEdgeAnchor {
        store.constraint(for: .top, relation: relation)?.priority = .init(priority)
        store.constraint(for: .bottom, relation: relation)?.priority = .init(priority)
        store.constraint(for: .leading, relation: relation)?.priority = .init(priority)
        store.constraint(for: .trailing, relation: relation)?.priority = .init(priority)
        return self
    }
    
    @discardableResult
    public func priority(_ priority: ALAnchorPriority) -> ALEdgeAnchor {
        store.constraint(for: .top, relation: relation)?.priority = .init(priority.value)
        store.constraint(for: .bottom, relation: relation)?.priority = .init(priority.value)
        store.constraint(for: .leading, relation: relation)?.priority = .init(priority.value)
        store.constraint(for: .trailing, relation: relation)?.priority = .init(priority.value)
        return self
    }
    
    public func remove() {
        store.removeConstraint(for: .top, relation: relation)
        store.removeConstraint(for: .bottom, relation: relation)
        store.removeConstraint(for: .leading, relation: relation)
        store.removeConstraint(for: .trailing, relation: relation)
    }
    
    public func deactivate() {
        store.constraint(for: .top, relation: relation)?.isActive = false
        store.constraint(for: .bottom, relation: relation)?.isActive = false
        store.constraint(for: .leading, relation: relation)?.isActive = false
        store.constraint(for: .trailing, relation: relation)?.isActive = false
    }
    
    public func reactivate() {
        store.constraint(for: .top, relation: relation)?.isActive = true
        store.constraint(for: .bottom, relation: relation)?.isActive = true
        store.constraint(for: .leading, relation: relation)?.isActive = true
        store.constraint(for: .trailing, relation: relation)?.isActive = true
    }
}


extension ALEdgeAnchor {
    
    private func equalTo(_ item: ALLayoutItem) -> Self {
        let top = self.item.anchor(for: .top).constraint(equalTo: item.anchor(for: .top))
        let bottom = self.item.anchor(for: .bottom).constraint(equalTo: item.anchor(for: .bottom))
        let leading = self.item.anchor(for: .leading).constraint(equalTo: item.anchor(for: .leading))
        let trailing = self.item.anchor(for: .trailing).constraint(equalTo: item.anchor(for: .trailing))
        store.addConstraint(top, type: .top, relation: .equalTo)
        store.addConstraint(bottom, type: .bottom, relation: .equalTo)
        store.addConstraint(leading, type: .leading, relation: .equalTo)
        store.addConstraint(trailing, type: .trailing, relation: .equalTo)
        return .init(relation: .equalTo, item: item, store: store)
    }
    
    private func lessOrEqualTo(_ item: ALLayoutItem) -> Self {
        let top = self.item.anchor(for: .top).constraint(lessThanOrEqualTo: item.anchor(for: .top))
        let bottom = self.item.anchor(for: .bottom).constraint(lessThanOrEqualTo: item.anchor(for: .bottom))
        let leading = self.item.anchor(for: .leading).constraint(lessThanOrEqualTo: item.anchor(for: .leading))
        let trailing = self.item.anchor(for: .trailing).constraint(lessThanOrEqualTo: item.anchor(for: .trailing))
        store.addConstraint(top, type: .top, relation: .lessOrEqualTo)
        store.addConstraint(bottom, type: .bottom, relation: .lessOrEqualTo)
        store.addConstraint(leading, type: .leading, relation: .lessOrEqualTo)
        store.addConstraint(trailing, type: .trailing, relation: .lessOrEqualTo)
        return .init(relation: .lessOrEqualTo, item: item, store: store)
    }
    
    private func greaterOrEqualTo(_ item: ALLayoutItem) -> Self {
        let top = self.item.anchor(for: .top).constraint(greaterThanOrEqualTo: item.anchor(for: .top))
        let bottom = self.item.anchor(for: .bottom).constraint(greaterThanOrEqualTo: item.anchor(for: .bottom))
        let leading = self.item.anchor(for: .leading).constraint(greaterThanOrEqualTo: item.anchor(for: .leading))
        let trailing = self.item.anchor(for: .trailing).constraint(greaterThanOrEqualTo: item.anchor(for: .trailing))
        store.addConstraint(top, type: .top, relation: .greaterOrEqualTo)
        store.addConstraint(bottom, type: .bottom, relation: .greaterOrEqualTo)
        store.addConstraint(leading, type: .leading, relation: .greaterOrEqualTo)
        store.addConstraint(trailing, type: .trailing, relation: .greaterOrEqualTo)
        return .init(relation: .greaterOrEqualTo, item: item, store: store)
    }
    
    @discardableResult
    public func padding(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat) -> Self {
        ALYAxisAnchor(type: .top, relation: relation, item: item, store: store).padding(top)
        ALYAxisAnchor(type: .bottom, relation: relation, item: item, store: store).padding(bottom)
        ALXAxisAnchor(type: .leading, relation: relation, item: item, store: store).padding(leading)
        ALXAxisAnchor(type: .trailing, relation: relation, item: item, store: store).padding(trailing)
        return self
    }
}


extension ALEdgeAnchor {
    
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


extension ALEdgeAnchor {
    
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


extension ALEdgeAnchor {
    
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
