import SwiftUI

public struct ListView<Content: View>: View {
  private let content: () -> Content
  
  public init(content: @escaping () -> Content) {
    self.content = content
  }
  
  public var body: some View {
    ScrollView(.vertical) {
      LazyVStack {
        content()
      }
      .padding([.leading, .trailing], DSSpacings.Inline.normal)
      .padding([.top, .bottom], DSSpacings.Stack.normal)
    }
    .overlay {
      Rectangle()
        .fill(DSColors.background)
        .mask {
          LinearGradient(gradient: Gradient(stops: [
            .init(color: DSColors.background.opacity(0),
                  location: 0.75),
            .init(color: DSColors.background.opacity(0.6),
                  location: 0.8),
            .init(color: DSColors.background.opacity(0.9),
                          location: 0.9),
            .init(color: DSColors.background.opacity(1),
                  location: 0.95),
          ]), startPoint: .top, endPoint: .bottom)
        }
      .ignoresSafeArea()
      .allowsHitTesting(false)
    }
  }
}

#Preview {
  ZStack {
    DSColors.background
    VStack {
      ListView {
        ForEach(0..<100) { index in
          BaseCardView {
            Text("\(index)\nBaseCards")
          }
        }
      }
      Rectangle()
        .frame(height: 120)
        .opacity(0)
    }
  }
}
