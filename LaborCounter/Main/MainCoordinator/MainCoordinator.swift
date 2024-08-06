import SwiftUI
import NavUI
import ContractionCounter

final class MainCoordinator: MainCoordinatorProtocol {
  private let navigation: Navigation
  
  init(navigation: Navigation = .init()) {
    self.navigation = navigation
  }
  
  func start() -> some View {
    navigation.start(root: ContractionCounterBuilder.start(navigation: navigation))
  }
  
}

protocol MainCoordinatorProtocol {
  associatedtype VView: View
  func start() -> VView
}

//enum MainFeature {
//  case contractionCounter
//}

// TODO: Organizes files and add composer to main
