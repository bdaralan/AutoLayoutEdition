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
}


extension ALSizeAnchor {
    
    func equalTo(_ item: ALLayoutItem) -> Self {
        let width = self.item.anchor(for: .width).constraint(equalTo: item.anchor(for: .width))
        let height = self.item.anchor(for: .height).constraint(equalTo: item.anchor(for: .height))
        store.activateConstraint(width, type: .width, relation: .equalTo)
        store.activateConstraint(height, type: .height, relation: .equalTo)
        return .init(relation: .equalTo, item: item, store: store)
    }
    
    func lessOrEqualTo(_ item: ALLayoutItem) -> Self {
        let width = self.item.anchor(for: .width).constraint(lessThanOrEqualTo: item.anchor(for: .width))
        let height = self.item.anchor(for: .height).constraint(lessThanOrEqualTo: item.anchor(for: .height))
        store.activateConstraint(width, type: .width, relation: .lessOrEqualTo)
        store.activateConstraint(height, type: .height, relation: .lessOrEqualTo)
        return .init(relation: .lessOrEqualTo, item: item, store: store)
    }
    
    func greaterOrEqualTo(_ item: ALLayoutItem) -> Self {
        let width = self.item.anchor(for: .width).constraint(greaterThanOrEqualTo: item.anchor(for: .width))
        let height = self.item.anchor(for: .height).constraint(greaterThanOrEqualTo: item.anchor(for: .height))
        store.activateConstraint(width, type: .width, relation: .greaterOrEqualTo)
        store.activateConstraint(height, type: .height, relation: .greaterOrEqualTo)
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
    public func equalTo(_ guide: UILayoutGuide) -> Self {
        equalTo(guide.anchorItem)
    }
}
