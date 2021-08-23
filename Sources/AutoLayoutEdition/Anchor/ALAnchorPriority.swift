import UIKit


/// Anchor layout priority.
///
public struct ALAnchorPriority {
    
    public let value: Float
    
    public init(_ value: Float) {
        self.value = value
    }
    
    public init(_ priority: UILayoutPriority) {
        value = priority.rawValue
    }
    
    static public func +(lhs: Self, rhs: Float) -> Self {
        .init(lhs.value + rhs)
    }
    
    static public func -(lhs: Self, rhs: Float) -> Self {
        .init(lhs.value - rhs)
    }
}


extension ALAnchorPriority {
    
    static public let required = ALAnchorPriority(.required)
    
    static public let high = ALAnchorPriority(.defaultHigh)
    
    static public let dragCanResizeScene = ALAnchorPriority(.dragThatCanResizeScene)
    
    static public let sceneSizeStayPut = ALAnchorPriority(.sceneSizeStayPut)
    
    static public let dragCannotResizeScene = ALAnchorPriority(.dragThatCannotResizeScene)
    
    static public let low = ALAnchorPriority(.defaultLow)
    
    static public let fittingSizeLevel = ALAnchorPriority(.fittingSizeLevel)
}
