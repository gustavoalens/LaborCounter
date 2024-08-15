import SwiftUI

public struct RoundedIconButtonView: View {
  let icon: Image
  var size: Size = .normal
  let action: () -> Void
  
  @State private var isPressing: Bool = false
  
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
  RoundedIconButtonView(icon: Image(systemName: "play.circle")) {
    print("didTap")
  }
}
