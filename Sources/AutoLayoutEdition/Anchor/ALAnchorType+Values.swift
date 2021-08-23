import Foundation


// MARK: - X Axis

public enum ALXAxisAnchorType: String, ALAnchorType {
    
    public var identifier: String { rawValue }
    
    case leading
    
    case trailing
    
    case centerX
}


// MARK: - Y Axis

public enum ALYAxisAnchorType: String, ALAnchorType {
    
    public var identifier: String { rawValue }
    
    case top
    
    case bottom
    
    case centerY
    
    case firstBaseline
    
    case lastBaseline
}


// MARK: - Dimension

public enum ALDimensionAnchorType: String, ALAnchorType {
    
    public var identifier: String { rawValue }
    
    case width
    
    case height
}


// MARK: - Edge

public struct ALEdgeAnchorType: ALAnchorType {
    
    public var identifier: String { "edges" }
}


// MARK: - Center

public struct ALCenterAnchorType: ALAnchorType {
    
    public var identifier: String { "center" }
}


// MARK: - Size

public struct ALSizeAnchorType: ALAnchorType {
    
    public var identifier: String { "size" }
}
