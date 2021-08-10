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
    
    func pinTo(item: ALAnchorItem) -> Self {
        top.equalTo(item.layoutAnchor(for: .top))
        bottom.equalTo(item.layoutAnchor(for: .bottom))
        leading.equalTo(item.layoutAnchor(for: .leading))
        trailing.equalTo(item.layoutAnchor(for: .trailing))
        return self
    }
    
    func centerTo(item: ALAnchorItem) -> Self {
        centerX.equalTo(item.layoutAnchor(for: .centerX))
        centerY.equalTo(item.layoutAnchor(for: .centerY))
        return self
    }
    
    func sizeTo(item: ALAnchorItem) -> Self {
        width.equalTo(item.layoutAnchor(for: .width))
        height.equalTo(item.layoutAnchor(for: .height))
        return self
    }
    
    /// Pin edge anchor to view.
    ///
    /// - Parameter view: The view to pin to.
    @discardableResult
    public func pinTo(_ view: UIView) -> Self {
        pinTo(item: view)
    }
    
    /// Pin edge anchor to guide.
    ///
    /// - Parameter guide: The guide to pin to.
    @discardableResult
    public func pinTo(_ guide: UILayoutGuide) -> Self {
        pinTo(item: guide)
    }
    
    /// Pin center anchor to view.
    ///
    /// - Parameter view: The view to center to.
    @discardableResult
    public func centerTo(_ view: UIView) -> Self {
        centerTo(item: view)
    }
    
    /// Pin center anchor to guide.
    ///
    /// - Parameter guide: The guide to center to.
    @discardableResult
    public func centerTo(_ guide: UILayoutGuide) -> Self {
        centerTo(item: guide)
    }
    
    /// Set size anchor to view.
    ///
    /// - Parameter view: The view to size to.
    @discardableResult
    public func sizeTo(_ view: UIView) -> Self {
        sizeTo(item: view)
    }
    
    /// Set size anchor to guide.
    ///
    /// - Parameter guide: The guide to size to.
    @discardableResult
    public func sizeTo(_ guide: UILayoutGuide) -> Self {
        sizeTo(item: guide)
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
