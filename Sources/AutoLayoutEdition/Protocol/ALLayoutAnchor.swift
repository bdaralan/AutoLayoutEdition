import UIKit


protocol ALLayoutAnchor {
    
    var top: ALYAxisAnchor { get }
    
    var bottom: ALYAxisAnchor { get }
    
    var leading: ALXAxisAnchor { get }
    
    var trailing: ALXAxisAnchor { get }
    
    var centerX: ALXAxisAnchor { get }
    
    var centerY: ALYAxisAnchor { get }
    
    var width: ALDimensionAnchor { get }
    
    var height: ALDimensionAnchor { get }
}


extension ALLayoutAnchor {
    
    /// Pin edge anchor to view.
    ///
    /// - Parameter view: The view to pin to.
    @discardableResult
    public func pinTo(_ view: UIView) -> Self {
        top.equalTo(view)
        bottom.equalTo(view)
        leading.equalTo(view)
        trailing.equalTo(view)
        return self
    }
    
    /// Pin edge anchor to guide.
    ///
    /// - Parameter guide: The guide to pin to.
    @discardableResult
    public func pinTo(_ guide: UILayoutGuide) -> Self {
        top.equalTo(guide)
        bottom.equalTo(guide)
        leading.equalTo(guide)
        trailing.equalTo(guide)
        return self
    }
    
    /// Set edge anchor padding.
    ///
    /// The each padding is applied to anchor that has been set.
    @discardableResult
    public func padding(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat) -> Self {
        self.top.padding(top)
        self.bottom.padding(bottom)
        self.leading.padding(leading)
        self.trailing.padding(trailing)
        return self
    }
    
    /// Pin center anchor to view.
    ///
    /// - Parameter view: The view to center to.
    @discardableResult
    public func centerTo(_ view: UIView) -> Self {
        centerX.equalTo(view)
        centerY.equalTo(view)
        return self
    }
    
    /// Pin center anchor to guide.
    ///
    /// - Parameter guide: The guide to center to.
    @discardableResult
    public func centerTo(_ guide: UILayoutGuide) -> Self {
        centerX.equalTo(guide)
        centerY.equalTo(guide)
        return self
    }
    
    /// Set center anchor padding.
    ///
    /// The each padding is applied to anchor that has been set.
    @discardableResult
    public func padding(centerX: CGFloat, centerY: CGFloat) -> Self {
        self.centerX.padding(centerX)
        self.centerY.padding(centerY)
        return self
    }
    
    /// Set size anchor to view.
    ///
    /// - Parameter view: The view to size to.
    @discardableResult
    public func sizeTo(_ view: UIView) -> Self {
        width.equalTo(view)
        height.equalTo(view)
        return self
    }
    
    /// Set size anchor to guide.
    ///
    /// - Parameter guide: The guide to size to.
    @discardableResult
    public func sizeTo(_ guide: UILayoutGuide) -> Self {
        width.equalTo(guide)
        height.equalTo(guide)
        return self
    }
    
    /// Set size anchor constant.
    @discardableResult
    public func sizeTo(width: CGFloat, height: CGFloat) -> Self {
        self.width.equalTo(width)
        self.height.equalTo(height)
        return self
    }
    
    /// Set size anchor padding.
    ///
    /// The each padding is applied to anchor that has been set.
    @discardableResult
    public func padding(width: CGFloat, height: CGFloat) -> Self {
        self.width.padding(width)
        self.height.padding(height)
        return self
    }
}
