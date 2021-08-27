import Foundation


/// An anchor that can layout first and last baseline.
///
public protocol ALLayoutBaselineAnchor {
    
    /// The first baseline anchor.
    var firstBaseline: ALYAxisAnchor { get }
    
    /// The last baseline anchor.
    var lastBaseline: ALYAxisAnchor { get }
}
