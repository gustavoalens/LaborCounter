import SwiftUI

public struct LogoView: View {
  private let style: Style
  
  public init(style: Style = .normal) {
    self.style = style
  }
  
  public var body: some View {
    ZStack {
      if let bg = style.getBGColor() {
          bg
      }
      style.getIcon()
        .resizable()
        .frame(width: style.getSize().width, height: style.getSize().height)
    }
    .frame(width: style.getSize().width + 16, height: style.getSize().height + 16)
    .cornerRadius(12)
  }
  
  public enum Style {
    case normal
    case large
    case initial
    
    func getIcon() -> Image {
      switch self {
        case .normal:
          return Image("logo-wbg_80", bundle: Bundle.module)
          
        case .large:
          return Image("logo-wbg_80", bundle: Bundle.module)
          
        case .initial:
          return Image("logo-wbg-160", bundle: Bundle.module)
      }
    }
    
    func getBGColor() -> Color? {
      switch self {
        case .normal:
          return DSColors.primary
          
        case .large:
          return DSColors.primary
          
        case .initial:
          return nil
      }
    }
    
    func getSize() -> CGSize {
      switch self {
        case .normal:
          return .init(width: 80, height: 80)
          
        case .large:
          return .init(width: 80, height: 80)
          
        case .initial:
          return .init(width: 160, height: 160)
      }
    }
  }
}

#Preview {
  VStack(alignment: .center, spacing: 8) {
    LogoView(style: .normal)
    LogoView(style: .large)
    LogoView(style: .initial)
  }
}
