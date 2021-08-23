import UIKit


/// An object that can store, activate, and deactivate constraints.
///
public protocol ALLayoutStore {
    
    /// The constraints that are set up with the store.
    var constraints: [NSLayoutConstraint] { get }
    
    /// Activate constraint.
    func activateConstraint(_ constraint: NSLayoutConstraint, type: ALAnchorType, relation: ALAnchorRelation)
    
    /// Retrieve a constraint for type and relation.
    ///
    /// - Returns: The constraint or `nil` if hasn't been setup.
    func constraint(for type: ALAnchorType, relation: ALAnchorRelation) -> NSLayoutConstraint?
    
    /// Retrieve a constant constraint for type and relation.
    ///
    /// - Note:
    ///   This is NOT the constant of a constraint, BUT the value of a constraint that is a constant.
    ///
    ///   To access a constraint's constant, use `constraint(for:relation:)` method to retrieve a constraint and then access its constant.
    ///
    ///   This is used internally to access the original value of a constant constraint.
    ///
    /// - Returns: The constant value or `nil` if hasn't been setup.
    func constant(for type: ALAnchorType, relation: ALAnchorRelation) -> CGFloat?
}


extension ALLayoutStore {
    
    /// Activate constraint.
    func activateConstraint(_ constraint: NSLayoutConstraint, type: ALXAxisAnchorType, relation: ALAnchorRelation) {
        activateConstraint(constraint, type: type, relation: relation)
    }
    
    /// Activate constraint.
    func activateConstraint(_ constraint: NSLayoutConstraint, type: ALYAxisAnchorType, relation: ALAnchorRelation) {
        activateConstraint(constraint, type: type, relation: relation)
    }
    
    /// Activate constraint.
    func activateConstraint(_ constraint: NSLayoutConstraint, type: ALDimensionAnchorType, relation: ALAnchorRelation) {
        activateConstraint(constraint, type: type, relation: relation)
    }

    /// Retrieve the constraint for type and relation.
    public func constraint(for type: ALXAxisAnchorType, relation: ALAnchorRelation) -> NSLayoutConstraint? {
        constraint(for: type, relation: relation)
    }
    
    /// Retrieve the constraint for type and relation.
    public func constraint(for type: ALYAxisAnchorType, relation: ALAnchorRelation) -> NSLayoutConstraint? {
        constraint(for: type, relation: relation)
    }
    
    /// Retrieve the constraint for type and relation.
    public func constraint(for type: ALDimensionAnchorType, relation: ALAnchorRelation) -> NSLayoutConstraint? {
        constraint(for: type, relation: relation)
    }
}


extension ALLayoutStore {
    
    /// Activate `constraints`.
    public func activateConstraints() {
        NSLayoutConstraint.activate(constraints)
    }
    
    /// Deactivate `constraints`.
    public func deactivateConstraints() {
        NSLayoutConstraint.deactivate(constraints)
    }
}
