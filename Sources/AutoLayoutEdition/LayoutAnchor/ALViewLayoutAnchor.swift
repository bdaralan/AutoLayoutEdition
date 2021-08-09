import UIKit


public struct ALViewLayoutAnchor: ALLayoutAnchor, ALLayoutBaselineAnchor {
    
    let view: UIView
    
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
        self.view = view
        top = .init(type: .top, item: view)
        bottom = .init(type: .bottom, item: view)
        leading = .init(type: .leading, item: view)
        trailing = .init(type: .trailing, item: view)
        centerX = .init(type: .centerX, item: view)
        centerY = .init(type: .centerY, item: view)
        width = .init(type: .width, item: view)
        height = .init(type: .height, item: view)
        firstBaseline = .init(type: .firstBaseline, item: view)
        lastBaseline = .init(type: .lastBaseline, item: view)
    }
}


extension UIView {

    public var anchor: ALViewLayoutAnchor {
        .init(view: self)
    }
    
    public func anchor(_ anchor: (ALViewLayoutAnchor) -> Void) {
        anchor(self.anchor)
    }
}
