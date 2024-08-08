import SwiftUI
import DesignSystem

struct ContractionCounterView<ViewModel: ContractionCounterViewModelProtocol>: View {
  @StateObject var viewModel: ViewModel
  
  var body: some View {
    DSColors.background
      .ignoresSafeArea()
      .overlay {
        VStack {
          Text("contraction_counter_navigation_title")
            .foregroundColor(DSColors.primary)
          //        .foregroundStyle()
          Text(ContractionCounterStrings.listTitle)
            .foregroundColor(DSColors.secondary)
          Text("test")
        }
      }
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
