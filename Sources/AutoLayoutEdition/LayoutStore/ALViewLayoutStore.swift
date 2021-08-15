import UIKit


final class ALViewLayoutStore: ALLayoutStore {

    let view: UIView
    
    private var constraintMap: [String: NSLayoutConstraint] = [:]
    private var constantMap: [String: CGFloat] = [:]
    
    var constraints: [NSLayoutConstraint] {
        constraintMap.map(\.value)
    }
    
    init(view: UIView) {
        self.view = view
    }
    
    func activateConstraint(_ constraint: NSLayoutConstraint, type: ALAnchorType, relation: ALAnchorRelation) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let key = "\(type.identifier).\(relation.identifier)"
        let isConstantConstraint = constraint.secondItem == nil
        constraintMap[key]?.isActive = false
        constraintMap[key] = constraint
        constantMap[key] = isConstantConstraint ? nil : constraint.constant
        
        constraint.isActive = true
    }
    
    func constraint(for type: ALAnchorType, relation: ALAnchorRelation) -> NSLayoutConstraint? {
        let key = "\(type.identifier).\(relation.identifier)"
        return constraintMap[key]
    }
    
    func constant(for type: ALAnchorType, relation: ALAnchorRelation) -> CGFloat? {
        let key = "\(type.identifier).\(relation.identifier)"
        return constantMap[key]
    }
}
