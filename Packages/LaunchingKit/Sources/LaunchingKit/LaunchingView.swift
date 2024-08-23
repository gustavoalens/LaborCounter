import SwiftUI
import DesignSystem
import Foundation

public struct LaunchingView<Content: View>: View {
  @State private var isLoading: Bool = true
  @State private var animate: Bool = false
  private var firstView: () -> Content
  
  public init(firstView: @escaping () -> Content) {
    self.firstView = firstView
  }
  
  public var body: some View {
    if !isLoading {
      firstView()
    } else {
      ZStack(alignment: .center) {
        DSColors.background
        RoundedRectangle(cornerRadius: 0)
          .fill(DSColors.primary)
          .frame(width: 188, height: 188)
          .cornerRadius(12)
          .shadow(radius: 2)
          .scaleEffect(animate ? 1.6 : 1.0)
        LogoView(style: .initial)
      }
      .onAppear {
        withAnimation(.spring(duration: 1.5, bounce: 1).delay(1.5)) {
          animate = true
        } completion: {
          withAnimation(.spring(duration: 0.2)) {
            animate = false
          } completion: {
            withAnimation(.easeOut) {
              isLoading = false
            }
          }
        } // TODO: change to phase animation
      }
    }
  }
}

#Preview {
  LaunchingView {
    Text("teste")
  }
}
