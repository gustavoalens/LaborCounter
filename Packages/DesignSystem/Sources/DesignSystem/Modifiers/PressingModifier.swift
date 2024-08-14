import SwiftUI

public struct PressingModifier: ViewModifier {
  let onPress: () -> Void
  let onRelease: () -> Void
  
  public func body(content: Content) -> some View {
    content
      .simultaneousGesture(
        DragGesture(minimumDistance: 0)
          .onChanged({ _ in
            onPress()
          })
          .onEnded({ _ in
            onRelease()
          })
      )
  }
}

public extension View {
  func press(onPress: @escaping () -> Void, onRelease: @escaping () -> Void) -> some View {
    modifier(PressingModifier(onPress: onPress, onRelease: onRelease))
  }
}
