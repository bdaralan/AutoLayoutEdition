import Foundation


public enum ALXAxisAnchorType: String, ALAnchorType {
    
    public var identifier: String { rawValue }
    
    case leading
    
    case trailing
    
    case centerX
}


public enum ALYAxisAnchorType: String, ALAnchorType {
    
    public var identifier: String { rawValue }
    
    case top
    
    case bottom
    
    case centerY
    
    case firstBaseline
    
    case lastBaseline
}


public enum ALDimensionAnchorType: String, ALAnchorType {
    
    public var identifier: String { rawValue }
    
    case width
    
    case height
}


public struct ALEdgeAnchorType: ALAnchorType {
    
    public var identifier: String { "edges" }
}


public struct ALCenterAnchorType: ALAnchorType {
    
    public var identifier: String { "center" }
}


public struct ALSizeAnchorType: ALAnchorType {
    
    public var identifier: String { "size" }
}
