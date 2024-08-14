import SwiftUI

public struct ButtonView: View {
  let title: String
  var size: Size = .normal
  let action: () -> Void
  
  @State private var isPressing: Bool = false
  
  public var body: some View {
    ZStack(alignment: .center) {
      DSColors.primary
        .cornerRadius(8)
      Text(title)
        .padding(.horizontal, DSSpacings.Inline.small)
        .padding(.vertical, DSSpacings.Stack.xsmall)
    }
    .frame(height: size.getSize())
    .padding(.horizontal, DSSpacings.Inline.normal)
    .scaleEffect(isPressing ? 1.045 : 1.0)
    .press {
      withAnimation(.interpolatingSpring(duration: 0.6, bounce: 2).repeatForever()) {
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
          return 48
      }
    }
  }
}

#Preview {
  ButtonView(title: "Button") { print("didTapButton") }
}
