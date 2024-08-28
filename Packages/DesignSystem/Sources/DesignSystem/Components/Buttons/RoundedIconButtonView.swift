import SwiftUI

public struct RoundedIconButtonView: View {
  private let icon: Image
  private let size: Size
  private let action: () -> Void
  
  @State private var isPressing: Bool = false
  
  public init(icon: Image, size: Size = .normal, action: @escaping () -> Void) {
    self.icon = icon
    self.size = size
    self.action = action
  }
  
  public var body: some View {
    ZStack(alignment: .center) {
      DSColors.primary
        .cornerRadius(size.getSize() / 2)
        .scaleEffect(isPressing ? 1.2 : 1.0)
      icon
        .resizable(resizingMode: .stretch)
        .renderingMode(.template)
        .colorMultiply(DSColors.accent)
        .frame(width: size.getIconSize().width, height: size.getIconSize().height)
        .scaleEffect(isPressing ? 0.9 : 1.0)
    }
    .frame(width: size.getSize(), height: size.getSize())
    .padding(.horizontal, DSSpacings.Inline.normal)
    .press {
      withAnimation(.interpolatingSpring(duration: 1.2, bounce: 2)) {
        isPressing = true
      }
    } onRelease: {
      withAnimation {
        isPressing = false
      }
      action()
    }
  }
  
  public enum Size {
    case normal
    case bigger
    
    fileprivate func getSize() -> CGFloat {
      switch self {
        case .normal: return 56
        case .bigger: return 80
      }
    }
    
    fileprivate func getIconSize() -> CGSize {
      switch self {
        case .normal: return .init(width: 42, height: 42)
        case .bigger: return .init(width: 46, height: 46)
      }
    }
  }
}

#Preview {
  ZStack {
    DSColors.background
    VStack(spacing: 24) {
      RoundedIconButtonView(icon: Image(systemName: "play.circle"), size: .normal) {
        print("didTap")
      }
      RoundedIconButtonView(icon: Image(systemName: "play.circle"), size: .bigger) {
        print("didTap")
      }
    }
  }
}
