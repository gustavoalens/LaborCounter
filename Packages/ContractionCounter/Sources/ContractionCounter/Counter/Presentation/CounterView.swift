import SwiftUI
import DesignSystem

struct CounterView: View {
  @State private var change: Bool = false
  @State private var balance: Double = -0.8
  var body: some View {
    ZStack(alignment: change ? .leading : .center) {
      VStack {
        if change {
          LazyVGrid(columns: [.init()]) {
            ThreeColumnCardView {
              VStack {
                Text("Start")
                Text("11")
              }
              
              BalanceView(balance: $balance)
              
              VStack {
                Text("buttom?")
                Text("31")
              }
            }
          }
        }
        RoundedIconButtonView(icon: Image(systemName: "play.circle")) {
          withAnimation(.easeIn) {
            change.toggle()
          }
        }
      }
    }
  }
}

#Preview {
  ZStack(alignment: .bottom) {
    DSColors.background
    VStack {
      ListView {
        ForEach(0..<100) { index in
          ThreeColumnCardView {
            Text("\(index)")
          }
        }
      }
      CounterView()
    }
  }
}
