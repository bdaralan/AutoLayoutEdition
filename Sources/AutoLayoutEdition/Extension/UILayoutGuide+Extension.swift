import UIKit


extension UILayoutGuide {
    
    var anchorItem: ALGuideLayoutItem {
        .init(guide: self)
    }
    
    public var anchor: ALGuideLayoutAnchor {
        .init(guide: self)
    }
    
    public func anchor(_ anchor: (ALGuideLayoutAnchor) -> Void) {
        anchor(self.anchor)
    }
}
