import UIKit


extension UILayoutGuide {
    
    var anchorItem: ALGuideLayoutItem {
        .init(guide: self)
    }
    
    /// A layout anchor used to setup anchors.
    ///
    /// - Note: For more details, see `UIView.anchor`'s documentation.
    public var anchor: ALGuideLayoutAnchor {
        .init(guide: self)
    }
    
    /// A convenience method for setting up anchor.
    public func anchor(_ anchor: (ALGuideLayoutAnchor) -> Void) {
        anchor(self.anchor)
    }
}
