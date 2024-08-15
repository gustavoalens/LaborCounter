import SwiftUI

struct BaseCardView<Content: View>: View {
  var selection: Selection = .selectable(action: {})
  let content: Content
  
  @State private var isPressing: Bool = false
  
  var body: some View {
    ZStack(alignment: .center) {
      RoundedRectangle(cornerRadius: 12)
        .fill(DSColors.accentBackground)
        .shadow(radius: isPressing ? 15 : 5)
      content
        .padding(.init(
          top: DSSpacings.Stack.small,
          leading: DSSpacings.Inline.small,
          bottom: DSSpacings.Stack.small,
          trailing: DSSpacings.Inline.small
        ))
    }
    .scaleEffect(isPressing ? 0.97 : 1)
    .press {
      switch selection {
        case .none:
          return
          
        case .selectable:
          withAnimation(.easeInOut(duration: 0.6)) {
            isPressing = true
          }
      }
    } onRelease: {
      switch selection {
        case .none:
          return
          
        case .selectable(let action):
          withAnimation {
            isPressing = false
          }
          action()
      }
    }
  }
  
  enum Selection {
    case none
    case selectable(action: () -> Void)
  }
}

#Preview {
  ZStack {
    DSColors.background
    LazyVGrid(columns: [.init(), .init()]) {
      BaseCardView(content: Text("Teste"))
      BaseCardView(content: Text("Testeadasdasdasdasdasdteste"))
      BaseCardView(content: Text("Teste"))
      BaseCardView(content: Text("Teste"))
    }
    .padding(.init(top: 0, leading: 6, bottom: 0, trailing: 6))
  }
  
  
}
