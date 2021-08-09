import UIKit


public struct ALGuideLayoutAnchor: ALLayoutAnchor {
    
    let guide: UILayoutGuide
    
    public let top: ALYAxisAnchor
    public let bottom: ALYAxisAnchor
    public let leading: ALXAxisAnchor
    public let trailing: ALXAxisAnchor
    
    public let centerX: ALXAxisAnchor
    public let centerY: ALYAxisAnchor
    
    public let width: ALDimensionAnchor
    public let height: ALDimensionAnchor
    
    init(guide: UILayoutGuide) {
        self.guide = guide
        top = .init(type: .top, item: guide)
        bottom = .init(type: .bottom, item: guide)
        leading = .init(type: .leading, item: guide)
        trailing = .init(type: .trailing, item: guide)
        centerX = .init(type: .centerX, item: guide)
        centerY = .init(type: .centerY, item: guide)
        width = .init(type: .width, item: guide)
        height = .init(type: .height, item: guide)
    }
}


extension UILayoutGuide {
    
    public var anchor: ALGuideLayoutAnchor {
        .init(guide: self)
    }
    
    public func anchor(_ anchor: (ALGuideLayoutAnchor) -> Void) {
        anchor(self.anchor)
    }
}
