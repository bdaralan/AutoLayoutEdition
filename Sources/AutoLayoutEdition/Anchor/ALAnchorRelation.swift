import Foundation


public enum ALAnchorRelation: String {
    
    var identifier: String { rawValue }
    
    case none
    
    case equalTo
    
    case equalToConstant
    
    case lessOrEqualTo
    
    case lessOrEqualToConstant
    
    case greaterOrEqualTo
    
    case greaterOrEqualToConstant
}
