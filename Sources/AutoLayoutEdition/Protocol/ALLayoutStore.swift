import UIKit


/// An object that can store, activate, and deactivate constraints.
///
public protocol ALLayoutStore {
    
    /// The constraints that are set up with the store.
    var constraints: [NSLayoutConstraint] { get }
    
    /// Add and activate the constraint.
    func addConstraint(_ constraint: NSLayoutConstraint, type: ALAnchorType, relation: ALAnchorRelation)
    
    /// Remove and deactivate a constraint with the specified type and relation.
    func removeConstraint(for type: ALAnchorType, relation: ALAnchorRelation)
    
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
    func addConstraint(_ constraint: NSLayoutConstraint, type: ALXAxisAnchorType, relation: ALAnchorRelation) {
        addConstraint(constraint, type: type, relation: relation)
    }
    
    /// Activate constraint.
    func addConstraint(_ constraint: NSLayoutConstraint, type: ALYAxisAnchorType, relation: ALAnchorRelation) {
        addConstraint(constraint, type: type, relation: relation)
    }
    
    /// Activate constraint.
    func addConstraint(_ constraint: NSLayoutConstraint, type: ALDimensionAnchorType, relation: ALAnchorRelation) {
        addConstraint(constraint, type: type, relation: relation)
    }
    
    /// Remove a constraint with the specified type and relation.
    public func removeConstraint(for type: ALXAxisAnchorType, relation: ALAnchorRelation) {
        removeConstraint(for: type, relation: relation)
    }
    
    /// Remove a constraint with the specified type and relation.
    public func removeConstraint(for type: ALYAxisAnchorType, relation: ALAnchorRelation) {
        removeConstraint(for: type, relation: relation)
    }
    
    /// Remove a constraint with the specified type and relation.
    public func removeConstraint(for type: ALDimensionAnchorType, relation: ALAnchorRelation) {
        removeConstraint(for: type, relation: relation)
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
