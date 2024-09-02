import SwiftUI
import DesignSystem

struct CounterView<ViewModel: CounterViewModelProtocol>: View {
  @State private var change: Bool = false
  @State private var balance: Double = -0.8
  @StateObject private var viewModel: ViewModel
  
  init(viewModel: ViewModel) {
    self._viewModel = .init(wrappedValue: viewModel)
  }
  
  var body: some View {
    ZStack(alignment: change ? .leading : .center) {
      VStack {
        if change {
          LazyVGrid(columns: [.init()]) {
            ThreeColumnCardView {
              VStack {
                Text("counter.init.title")
                Text("-")
              }
              VStack(alignment: .center, spacing: DSSpacings.Stack.small) {
                BalanceView(balance: $viewModel.viewObject.balanceReference)
                Text(viewModel.viewObject.timer)
              }
              VStack {
                Text("counter.interval.title")
                Text("-")
              }
            }
          }
          .padding(.vertical, DSSpacings.Stack.normal)
          .padding(.horizontal, DSSpacings.Inline.normal)
        }
        RoundedIconButtonView(icon: Image(systemName: "play.circle")) {
          withAnimation(.easeIn) {
            change.toggle()
            if change {
              viewModel.start()
            } else {
              viewModel.stop()
            }
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
      CounterView(viewModel: CounterViewModel())
    }
  }
}
