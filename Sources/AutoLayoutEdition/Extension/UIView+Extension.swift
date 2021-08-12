import UIKit


extension UIView {
    
    var anchorItem: ALViewLayoutItem {
        .init(view: self)
    }
    
    public var anchor: ALViewLayoutAnchor {
        .init(view: self)
    }
    
    public func anchor(_ anchor: (ALViewLayoutAnchor) -> Void) {
        anchor(self.anchor)
    }
}
