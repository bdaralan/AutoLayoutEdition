import UIKit


struct ALGuideLayoutItem: ALLayoutItem {
    
    let guide: UILayoutGuide
    
    func anchor(for type: ALXAxisAnchorType) -> NSLayoutXAxisAnchor {
        switch type {
        case .leading: return guide.leadingAnchor
        case .trailing: return guide.trailingAnchor
        case .centerX: return guide.centerXAnchor
        }
    }
    
    func anchor(for type: ALYAxisAnchorType) -> NSLayoutYAxisAnchor {
        switch type {
        case .top: return guide.topAnchor
        case .bottom: return guide.bottomAnchor
        case .centerY: return guide.centerYAnchor
        case .firstBaseline:
            print("⚠️ UILayoutGuide does not have firstBaselineAnchor (topAnchor is used) ⚠️")
            return guide.topAnchor
        case .lastBaseline:
            print("⚠️ UILayoutGuide does not have lastBaselineAnchor (bottomAnchor is used) ⚠️")
            return guide.bottomAnchor
        }
    }
    
    func anchor(for type: ALDimensionAnchorType) -> NSLayoutDimension {
        switch type {
        case .width: return guide.widthAnchor
        case .height: return guide.heightAnchor
        }
    }
    
    func setHuggingPriority(_ priority: ALAnchorPriority, for type: ALDimensionAnchorType) {
        print("⚠️ Setting hugging priority on UILayoutGuide does nothing ⚠️")
    }
    
    func setUncompressingPriority(_ priority: ALAnchorPriority, for type: ALDimensionAnchorType) {
        print("⚠️ Setting uncompressing priority on UILayoutGuide does nothing ⚠️")
    }
}
