import Foundation


/// Anchor layout relation.
///
public enum ALAnchorRelation: String {
    
    var identifier: String { rawValue }
    
    case none
    
    case equalTo
    
    case lessOrEqualTo
    
    case greaterOrEqualTo
}
