import SwiftUI
import NavUI

final class ContractionCounterCoordinator: ContractionCounterCoordinatorProtocol {
  private let navigation: Navigation
  
  init(navigation: Navigation) {
    self.navigation = navigation
  }
  
  func start<ViewModel: ContractionCounterViewModelProtocol>(viewModel: ViewModel) {
    _ = navigation.start(root: ContractionCounterView<ViewModel>(viewModel: viewModel))
  }
  
}


protocol ContractionCounterCoordinatorProtocol: ObservableObject {
}

