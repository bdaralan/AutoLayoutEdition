import UIKit


public struct ALYAxisAnchor: ALAnchor {
    
    let type: ALYAxisAnchorType
    
    let item: ALAnchorItem
    
    public var constraint: NSLayoutConstraint? { store.constraint }
    
    private let store = Store()
    
    private class Store {
        var constraint: NSLayoutConstraint?
    }
    
    private func activateConstraint(_ constraint: NSLayoutConstraint) {
        item.enableAutoLayout()
        store.constraint?.isActive = false
        store.constraint = constraint
        store.constraint?.isActive = true
    }
}


extension ALYAxisAnchor {
    
    @discardableResult
    public func equalTo(_ anchor: Self) -> Self {
        let anchor1 = item.anchor(for: type)
        let anchor2 = anchor.item.anchor(for: anchor.type)
        let constraint = anchor1.constraint(equalTo: anchor2)
        activateConstraint(constraint)
        return self
    }
    
    @discardableResult
    public func lessOrEqualTo(_ anchor: Self) -> Self {
        let anchor1 = item.anchor(for: type)
        let anchor2 = anchor.item.anchor(for: anchor.type)
        let constraint = anchor1.constraint(lessThanOrEqualTo: anchor2)
        activateConstraint(constraint)
        return self
    }
    
    @discardableResult
    public func greaterOrEqualTo(_ anchor: Self) -> Self {
        let anchor1 = item.anchor(for: type)
        let anchor2 = anchor.item.anchor(for: anchor.type)
        let constraint = anchor1.constraint(greaterThanOrEqualTo: anchor2)
        activateConstraint(constraint)
        return self
    }
    
    @discardableResult
    public func padding(_ padding: CGFloat) -> Self {
        guard let constraint = store.constraint else { return self }
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
    public func equalTo(_ view: UIView) -> Self {
        equalTo(view.layoutAnchor(for: type))
    }
    
    @discardableResult
    public func lessOrEqualTo(_ view: UIView) -> Self {
        lessOrEqualTo(view.layoutAnchor(for: type))
    }
    
    @discardableResult
    public func greaterOrEqualTo(_ view: UIView) -> Self {
        greaterOrEqualTo(view.layoutAnchor(for: type))
    }
}


extension ALYAxisAnchor {
    
    @discardableResult
    public func equalTo(_ guide: UILayoutGuide) -> Self {
        equalTo(guide.layoutAnchor(for: type))
    }

    @discardableResult
    public func lessOrEqualTo(_ guide: UILayoutGuide) -> Self {
        lessOrEqualTo(guide.layoutAnchor(for: type))
    }
    
    @discardableResult
    public func greaterOrEqualTo(_ guide: UILayoutGuide) -> Self {
        greaterOrEqualTo(guide.layoutAnchor(for: type))
    }
}
