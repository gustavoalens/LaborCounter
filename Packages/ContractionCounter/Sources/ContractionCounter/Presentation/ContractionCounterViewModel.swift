import SwiftUI

protocol ContractionCounterViewModelProtocol: ObservableObject, AnyObject { }

final class ContractionCounterViewModel: ContractionCounterViewModelProtocol {
  private let coordinator: any ContractionCounterCoordinatorProtocol
  
  init(coordinator: any ContractionCounterCoordinatorProtocol) {
    self.coordinator = coordinator
  
  }
  
}
