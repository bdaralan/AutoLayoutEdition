import UIKit


struct ALGuideLayoutItem: ALLayoutItem {
    
    let guide: UILayoutGuide
    
    func layoutAnchor(for type: ALXAxisAnchorType) -> NSLayoutXAxisAnchor {
        switch type {
        case .leading: return guide.leadingAnchor
        case .trailing: return guide.trailingAnchor
        case .centerX: return guide.centerXAnchor
        }
    }
    
    func layoutAnchor(for type: ALYAxisAnchorType) -> NSLayoutYAxisAnchor {
        switch type {
        case .top: return guide.topAnchor
        case .bottom: return guide.bottomAnchor
        case .centerY: return guide.centerYAnchor
        case .firstBaseline, .lastBaseline:
            print("⚠️ UILayoutGuide does not have YAxisAnchor '\(type)' (centerYAnchor is used) ⚠️")
            return guide.centerYAnchor
        }
    }
    
    func layoutAnchor(for type: ALDimensionAnchorType) -> NSLayoutDimension {
        switch type {
        case .width: return guide.widthAnchor
        case .height: return guide.heightAnchor
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
