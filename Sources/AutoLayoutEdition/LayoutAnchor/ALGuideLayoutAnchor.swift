import UIKit


public struct ALGuideLayoutAnchor: ALLayoutAnchor {
    
    let item: ALGuideLayoutItem
    public var guide: UILayoutGuide { item.guide }
    
    public let top: ALYAxisAnchor
    public let bottom: ALYAxisAnchor
    public let leading: ALXAxisAnchor
    public let trailing: ALXAxisAnchor
    
    public let centerX: ALXAxisAnchor
    public let centerY: ALYAxisAnchor
    
    public let width: ALDimensionAnchor
    public let height: ALDimensionAnchor
    
    init(guide: UILayoutGuide) {
        item = .init(guide: guide)
        top = .init(type: .top, item: item)
        bottom = .init(type: .bottom, item: item)
        leading = .init(type: .leading, item: item)
        trailing = .init(type: .trailing, item: item)
        centerX = .init(type: .centerX, item: item)
        centerY = .init(type: .centerY, item: item)
        width = .init(type: .width, item: item)
        height = .init(type: .height, item: item)
    }
}
