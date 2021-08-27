import UIKit


public struct ALSizeAnchor: ALAnchor {
    
    public let type = ALSizeAnchorType()
    
    public let relation: ALAnchorRelation
    
    public let item: ALLayoutItem
    
    public let store: ALLayoutStore
    
    @discardableResult
    public func priority(_ priority: Float) -> ALSizeAnchor {
        store.constraint(for: .width, relation: relation)?.priority = .init(priority)
        store.constraint(for: .height, relation: relation)?.priority = .init(priority)
        return self
    }
    
    @discardableResult
    public func priority(_ priority: ALAnchorPriority) -> ALSizeAnchor {
        store.constraint(for: .width, relation: relation)?.priority = .init(priority.value)
        store.constraint(for: .height, relation: relation)?.priority = .init(priority.value)
        return self
    }
    
    public func remove() {
        store.removeConstraint(for: .width, relation: relation)
        store.removeConstraint(for: .height, relation: relation)
    }
    
    public func deactivate() {
        store.constraint(for: .width, relation: relation)?.isActive = false
        store.constraint(for: .height, relation: relation)?.isActive = false
    }
    
    public func reactivate() {
        store.constraint(for: .width, relation: relation)?.isActive = true
        store.constraint(for: .height, relation: relation)?.isActive = true
    }
}


extension ALSizeAnchor {
    
    private func equalTo(_ item: ALLayoutItem) -> Self {
        let width = self.item.anchor(for: .width).constraint(equalTo: item.anchor(for: .width))
        let height = self.item.anchor(for: .height).constraint(equalTo: item.anchor(for: .height))
        store.addConstraint(width, type: .width, relation: .equalTo)
        store.addConstraint(height, type: .height, relation: .equalTo)
        return .init(relation: .equalTo, item: item, store: store)
    }
    
    private func lessOrEqualTo(_ item: ALLayoutItem) -> Self {
        let width = self.item.anchor(for: .width).constraint(lessThanOrEqualTo: item.anchor(for: .width))
        let height = self.item.anchor(for: .height).constraint(lessThanOrEqualTo: item.anchor(for: .height))
        store.addConstraint(width, type: .width, relation: .lessOrEqualTo)
        store.addConstraint(height, type: .height, relation: .lessOrEqualTo)
        return .init(relation: .lessOrEqualTo, item: item, store: store)
    }
    
    private func greaterOrEqualTo(_ item: ALLayoutItem) -> Self {
        let width = self.item.anchor(for: .width).constraint(greaterThanOrEqualTo: item.anchor(for: .width))
        let height = self.item.anchor(for: .height).constraint(greaterThanOrEqualTo: item.anchor(for: .height))
        store.addConstraint(width, type: .width, relation: .greaterOrEqualTo)
        store.addConstraint(height, type: .height, relation: .greaterOrEqualTo)
        return .init(relation: .greaterOrEqualTo, item: item, store: store)
    }
    
    @discardableResult
    public func adding(width: CGFloat, height: CGFloat) -> Self {
        ALDimensionAnchor(type: .width, relation: relation, item: item, store: store).adding(width)
        ALDimensionAnchor(type: .height, relation: relation, item: item, store: store).adding(height)
        return self
    }
    
    @discardableResult
    public func subtracting(width: CGFloat, height: CGFloat) -> Self {
        ALDimensionAnchor(type: .width, relation: relation, item: item, store: store).subtracting(width)
        ALDimensionAnchor(type: .height, relation: relation, item: item, store: store).subtracting(height)
        return self
    }
}


extension ALSizeAnchor {
    
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



extension ALSizeAnchor {
    
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


extension ALSizeAnchor {
    
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
