import UIKit


extension UILayoutGuide {
    
    var anchorItem: ALGuideLayoutItem {
        .init(guide: self)
    }
    
    /// A layout anchor used to setup constraints.
    ///
    /// - Note: For more details, see [UIView's anchor][UIView.anchor] property documentation.
    ///
    /// [UIView.anchor]: x-source-tag://UIView.anchor
    public var anchor: ALGuideLayoutAnchor {
        .init(guide: self)
    }
    
    /// A convenience method for setting up constraints in a block.
    public func anchor(_ anchor: (ALGuideLayoutAnchor) -> Void) {
        anchor(self.anchor)
    }
}
