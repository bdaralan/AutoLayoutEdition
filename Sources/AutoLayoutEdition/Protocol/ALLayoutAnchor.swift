import UIKit


public protocol ALLayoutAnchor {
    
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
    
    func pinTo(item: ALLayoutItem) -> Self {
        top.equalTo(item.anchor(for: .top))
        bottom.equalTo(item.anchor(for: .bottom))
        leading.equalTo(item.anchor(for: .leading))
        trailing.equalTo(item.anchor(for: .trailing))
        return self
    }
    
    func centerTo(item: ALLayoutItem) -> Self {
        centerX.equalTo(item.anchor(for: .centerX))
        centerY.equalTo(item.anchor(for: .centerY))
        return self
    }
    
    func sizeTo(item: ALLayoutItem) -> Self {
        width.equalTo(item.anchor(for: .width))
        height.equalTo(item.anchor(for: .height))
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
    
    /// Set center anchor padding.
    ///
    /// The each padding is applied to anchor that has been set.
    @discardableResult
    public func padding(centerX: CGFloat, centerY: CGFloat) -> Self {
        self.centerX.padding(centerX)
        self.centerY.padding(centerY)
        return self
    }
    
    /// Adjust size anchor.
    ///
    /// The each value is applied to anchor that has been set.
    @discardableResult
    public func adding(width: CGFloat, height: CGFloat) -> Self {
        self.width.adding(width)
        self.height.adding(height)
        return self
    }
    
    /// Adjust size anchor.
    ///
    /// The each value is applied to anchor that has been set.
    @discardableResult
    public func subtracting(width: CGFloat, height: CGFloat) -> Self {
        self.width.subtracting(width)
        self.height.subtracting(height)
        return self
    }
}


extension ALLayoutAnchor {
    
    /// Pin edge anchor to view.
    ///
    /// - Parameter view: The view to pin to.
    @discardableResult
    public func pinTo(_ view: UIView) -> Self {
        pinTo(item: view.anchorItem)
    }
    
    /// Pin center anchor to view.
    ///
    /// - Parameter view: The view to center to.
    @discardableResult
    public func centerTo(_ view: UIView) -> Self {
        centerTo(item: view.anchorItem)
    }
    
    /// Set size anchor to view.
    ///
    /// - Parameter view: The view to size to.
    @discardableResult
    public func sizeTo(_ view: UIView) -> Self {
        sizeTo(item: view.anchorItem)
    }
}


extension ALLayoutAnchor {
    
    /// Pin edge anchor to guide.
    ///
    /// - Parameter guide: The guide to pin to.
    @discardableResult
    public func pinTo(_ guide: UILayoutGuide) -> Self {
        pinTo(item: guide.anchorItem)
    }
    
    /// Pin center anchor to guide.
    ///
    /// - Parameter guide: The guide to center to.
    @discardableResult
    public func centerTo(_ guide: UILayoutGuide) -> Self {
        centerTo(item: guide.anchorItem)
    }
    
    /// Set size anchor to guide.
    ///
    /// - Parameter guide: The guide to size to.
    @discardableResult
    public func sizeTo(_ guide: UILayoutGuide) -> Self {
        sizeTo(item: guide.anchorItem)
    }
}
