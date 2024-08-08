import SwiftUI
import NavUI
import ContractionCounter

final class MainCoordinator: MainCoordinatorProtocol {
  private let navigation: Navigation
  
  init(navigation: Navigation = .init()) {
    self.navigation = navigation
  }
  
  func start() -> some View {
    AnyView(startCounter())
  }
  
  func startCounter() -> any View {
    navigation.start(root: ContractionCounterBuilder.start(navigation: navigation))
  }
  
}

protocol MainCoordinatorProtocol {
  func startCounter() -> any View
}
