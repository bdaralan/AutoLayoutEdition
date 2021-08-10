import UIKit


protocol ALAnchorItem {
    
    func anchor(for type: ALXAxisAnchorType) -> NSLayoutXAxisAnchor
    
    func anchor(for type: ALYAxisAnchorType) -> NSLayoutYAxisAnchor
    
    func anchor(for type: ALDimensionAnchorType) -> NSLayoutDimension
    
    func enableAutoLayout()
    
    func setHuggingPriority(_ priority: ALAnchorPriority, for type: ALDimensionAnchorType)
    
    func setUncompressingPriority(_ priority: ALAnchorPriority, for type: ALDimensionAnchorType)
}


extension ALAnchorItem {
    
    func layoutAnchor(for type: ALXAxisAnchorType) -> ALXAxisAnchor {
        .init(type: type, item: self)
    }
    
    func layoutAnchor(for type: ALYAxisAnchorType) -> ALYAxisAnchor {
        .init(type: type, item: self)
    }
    
    func layoutAnchor(for type: ALDimensionAnchorType) -> ALDimensionAnchor {
        .init(type: type, item: self)
    }
}


// MARK: - UIView

extension UIView: ALAnchorItem {
    
    func anchor(for type: ALXAxisAnchorType) -> NSLayoutXAxisAnchor {
        switch type {
        case .leading: return leadingAnchor
        case .trailing: return trailingAnchor
        case .centerX: return centerXAnchor
        }
    }
    
    func anchor(for type: ALYAxisAnchorType) -> NSLayoutYAxisAnchor {
        switch type {
        case .top: return topAnchor
        case .bottom: return bottomAnchor
        case .centerY: return centerYAnchor
        case .firstBaseline: return firstBaselineAnchor
        case .lastBaseline: return lastBaselineAnchor
        }
    }
    
    func anchor(for type: ALDimensionAnchorType) -> NSLayoutDimension {
        switch type {
        case .width: return widthAnchor
        case .height: return heightAnchor
        }
    }
    
    func enableAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setHuggingPriority(_ priority: ALAnchorPriority, for type: ALDimensionAnchorType) {
        switch type {
        case .width: setContentHuggingPriority(.init(priority.value), for: .horizontal)
        case .height: setContentHuggingPriority(.init(priority.value), for: .vertical)
        }
    }
    
    func setUncompressingPriority(_ priority: ALAnchorPriority, for type: ALDimensionAnchorType) {
        switch type {
        case .width: setContentCompressionResistancePriority(.init(priority.value), for: .horizontal)
        case .height: setContentCompressionResistancePriority(.init(priority.value), for: .vertical)
        }
    }
}


// MARK: - UILayoutGuide

extension UILayoutGuide: ALAnchorItem {
    
    func anchor(for type: ALXAxisAnchorType) -> NSLayoutXAxisAnchor {
        switch type {
        case .leading: return leadingAnchor
        case .trailing: return trailingAnchor
        case .centerX: return centerXAnchor
        }
    }
    
    func anchor(for type: ALYAxisAnchorType) -> NSLayoutYAxisAnchor {
        switch type {
        case .top: return topAnchor
        case .bottom: return bottomAnchor
        case .centerY: return centerYAnchor
        case .firstBaseline, .lastBaseline:
            print("⚠️ UILayoutGuide does not have YAxisAnchor '\(type)' (centerYAnchor is used) ⚠️")
            return centerYAnchor
        }
    }
    
    func anchor(for type: ALDimensionAnchorType) -> NSLayoutDimension {
        switch type {
        case .width: return widthAnchor
        case .height: return heightAnchor
        }
    }
    
    func enableAutoLayout() {
        // Guide does not have auto layout enabled state
    }
    
    func setHuggingPriority(_ priority: ALAnchorPriority, for type: ALDimensionAnchorType) {
        // Guide does not have hugging priority
    }
    
    func setUncompressingPriority(_ priority: ALAnchorPriority, for type: ALDimensionAnchorType) {
        // Guide does not have uncompress priority
    }
}
