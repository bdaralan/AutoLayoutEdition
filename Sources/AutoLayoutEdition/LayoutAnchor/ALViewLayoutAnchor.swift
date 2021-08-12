import UIKit


public struct ALViewLayoutAnchor: ALLayoutAnchor, ALLayoutBaselineAnchor {
    
    let item: ALViewLayoutItem
    public var view: UIView { item.view }
    
    public let top: ALYAxisAnchor
    public let bottom: ALYAxisAnchor
    public let leading: ALXAxisAnchor
    public let trailing: ALXAxisAnchor

    public let centerX: ALXAxisAnchor
    public let centerY: ALYAxisAnchor
    
    public let width: ALDimensionAnchor
    public let height: ALDimensionAnchor
    
    public let firstBaseline: ALYAxisAnchor
    public let lastBaseline: ALYAxisAnchor
    
    init(view: UIView) {
        item = .init(view: view)
        top = .init(type: .top, item: item)
        bottom = .init(type: .bottom, item: item)
        leading = .init(type: .leading, item: item)
        trailing = .init(type: .trailing, item: item)
        centerX = .init(type: .centerX, item: item)
        centerY = .init(type: .centerY, item: item)
        width = .init(type: .width, item: item)
        height = .init(type: .height, item: item)
        firstBaseline = .init(type: .firstBaseline, item: item)
        lastBaseline = .init(type: .lastBaseline, item: item)
    }
}
