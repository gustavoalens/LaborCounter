import SwiftUI
import DesignSystem
import Foundation

public struct LaunchingView<Content: View>: View {
  @State private var isLoading: Bool = true
  @State private var animate: Bool = false
  @State private var fill: Color = DSColors.primary
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
          .fill(fill)
          .frame(width: 188, height: 188)
          .cornerRadius(12)
          .shadow(radius: 2)
          .scaleEffect(animate ? 100 : 1.0)
        LogoView(style: .initial)
      }
      .onAppear {
        withAnimation(.easeInOut(duration: 1.5).delay(1.5)) {
          animate = true
        } completion: {
          withAnimation(.easeInOut(duration: 0.2)) {
            fill = DSColors.background
          } completion: {
            withAnimation(.easeInOut(duration: 0.5)) {
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
