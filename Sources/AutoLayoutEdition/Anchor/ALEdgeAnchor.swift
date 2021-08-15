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
}


extension ALEdgeAnchor {
    
    func equalTo(_ item: ALLayoutItem) -> Self {
        let top = self.item.anchor(for: .top).constraint(equalTo: item.anchor(for: .top))
        let bottom = self.item.anchor(for: .bottom).constraint(equalTo: item.anchor(for: .bottom))
        let leading = self.item.anchor(for: .leading).constraint(equalTo: item.anchor(for: .leading))
        let trailing = self.item.anchor(for: .trailing).constraint(equalTo: item.anchor(for: .trailing))
        store.activateConstraint(top, type: .top, relation: .equalTo)
        store.activateConstraint(bottom, type: .bottom, relation: .equalTo)
        store.activateConstraint(leading, type: .leading, relation: .equalTo)
        store.activateConstraint(trailing, type: .trailing, relation: .equalTo)
        return .init(relation: .equalTo, item: item, store: store)
    }
    
    func lessOrEqualTo(_ item: ALLayoutItem) -> Self {
        let top = self.item.anchor(for: .top).constraint(lessThanOrEqualTo: item.anchor(for: .top))
        let bottom = self.item.anchor(for: .bottom).constraint(lessThanOrEqualTo: item.anchor(for: .bottom))
        let leading = self.item.anchor(for: .leading).constraint(lessThanOrEqualTo: item.anchor(for: .leading))
        let trailing = self.item.anchor(for: .trailing).constraint(lessThanOrEqualTo: item.anchor(for: .trailing))
        store.activateConstraint(top, type: .top, relation: .lessOrEqualTo)
        store.activateConstraint(bottom, type: .bottom, relation: .lessOrEqualTo)
        store.activateConstraint(leading, type: .leading, relation: .lessOrEqualTo)
        store.activateConstraint(trailing, type: .trailing, relation: .lessOrEqualTo)
        return .init(relation: .lessOrEqualTo, item: item, store: store)
    }
    
    func greaterOrEqualTo(_ item: ALLayoutItem) -> Self {
        let top = self.item.anchor(for: .top).constraint(greaterThanOrEqualTo: item.anchor(for: .top))
        let bottom = self.item.anchor(for: .bottom).constraint(greaterThanOrEqualTo: item.anchor(for: .bottom))
        let leading = self.item.anchor(for: .leading).constraint(greaterThanOrEqualTo: item.anchor(for: .leading))
        let trailing = self.item.anchor(for: .trailing).constraint(greaterThanOrEqualTo: item.anchor(for: .trailing))
        store.activateConstraint(top, type: .top, relation: .greaterOrEqualTo)
        store.activateConstraint(bottom, type: .bottom, relation: .greaterOrEqualTo)
        store.activateConstraint(leading, type: .leading, relation: .greaterOrEqualTo)
        store.activateConstraint(trailing, type: .trailing, relation: .greaterOrEqualTo)
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
    public func equalTo(_ guide: UILayoutGuide) -> Self {
        equalTo(guide.anchorItem)
    }
}
