import UIKit


struct ALViewLayoutItem: ALLayoutItem {
    
    let view: UIView
    
    func layoutAnchor(for type: ALXAxisAnchorType) -> NSLayoutXAxisAnchor {
        switch type {
        case .leading: return view.leadingAnchor
        case .trailing: return view.trailingAnchor
        case .centerX: return view.centerXAnchor
        }
    }
    
    func layoutAnchor(for type: ALYAxisAnchorType) -> NSLayoutYAxisAnchor {
        switch type {
        case .top: return view.topAnchor
        case .bottom: return view.bottomAnchor
        case .centerY: return view.centerYAnchor
        case .firstBaseline: return view.firstBaselineAnchor
        case .lastBaseline: return view.lastBaselineAnchor
        }
    }
    
    func layoutAnchor(for type: ALDimensionAnchorType) -> NSLayoutDimension {
        switch type {
        case .width: return view.widthAnchor
        case .height: return view.heightAnchor
        }
    }
    
    func enableAutoLayout() {
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setHuggingPriority(_ priority: ALAnchorPriority, for type: ALDimensionAnchorType) {
        switch type {
        case .width: view.setContentHuggingPriority(.init(priority.value), for: .horizontal)
        case .height: view.setContentHuggingPriority(.init(priority.value), for: .vertical)
        }
    }
    
    func setUncompressingPriority(_ priority: ALAnchorPriority, for type: ALDimensionAnchorType) {
        switch type {
        case .width: view.setContentCompressionResistancePriority(.init(priority.value), for: .horizontal)
        case .height: view.setContentCompressionResistancePriority(.init(priority.value), for: .vertical)
        }
    }
}
