import SwiftUI
import DesignSystem

struct ContractionCounterView<ViewModel: ContractionCounterViewModelProtocol>: View {
  @StateObject var viewModel: ViewModel
  
  var body: some View {
    ZStack(alignment: .bottom) {
      DSColors.background
        .ignoresSafeArea()
      VStack {
        ListView {
          ForEach(viewModel.viewObject.data) { data in
            ThreeColumnCardView {
              Text("\(data.id)")
              Text("\(data.duration)")
              Text(data.end)
            }
            .animation(.bouncy(duration: 0.8), value: viewModel.viewObject.data)
          }
        }
      }
      CounterBuilder.getView()
    }
  }
}

#Preview {
  ContractionCounterView(
    viewModel: ContractionCounterViewModel(
      coordinator: ContractionCounterCoordinator(
        navigation: .init()
      ),
      storage: ContractionCounterStorageMock()
    )
  )
}
