import SwiftUI

struct ContractionCounterView<ViewModel: ContractionCounterViewModelProtocol>: View {
  @StateObject var viewModel: ViewModel
  
  var body: some View {
    Text("Contraction View Showing")
  }
}

#Preview {
  ContractionCounterView(
    viewModel: ContractionCounterViewModel(
      coordinator: ContractionCounterCoordinator(
        navigation: .init()
      )
    )
  )
}
