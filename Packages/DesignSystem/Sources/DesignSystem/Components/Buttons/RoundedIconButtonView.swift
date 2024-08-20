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
      icon
        .resizable(resizingMode: .stretch)
        .renderingMode(.template)
        .colorMultiply(DSColors.accent)
        .frame(width: size.getIconSize().width, height: size.getIconSize().height)
    }
    .frame(width: size.getSize(), height: size.getSize())
    .padding(.horizontal, DSSpacings.Inline.normal)
    .scaleEffect(isPressing ? 1.3 : 1.0)
    .press {
      withAnimation(.interpolatingSpring(duration: 0.6, bounce: 2)) {
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
    
    fileprivate func getSize() -> CGFloat {
      switch self {
        case .normal:
          return 56
      }
    }
    
    fileprivate func getIconSize() -> CGSize {
      switch self {
        case .normal:
          return .init(width: 42, height: 42)
      }
    }
  }
}

#Preview {
  ZStack {
    DSColors.background
    RoundedIconButtonView(icon: Image(systemName: "play.circle")) {
      print("didTap")
    }
  }
}
