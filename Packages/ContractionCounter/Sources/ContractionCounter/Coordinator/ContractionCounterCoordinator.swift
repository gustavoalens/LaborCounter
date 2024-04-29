import SwiftUI
import Combine

final class ContractionCounterCoordinator: ContractionCounterCoordinatorProtocol {
  lazy var current: Binding<NavigationPath> = {
    .init(get: { [weak self] in
      self?.path ?? .init()
    }, set: { [weak self] newPath in
      self?.path = newPath
    })
  }()
  
  private var path: NavigationPath = .init()
  
  init(path: NavigationPath) {
    self.path = path
  }
  
}


protocol ContractionCounterCoordinatorProtocol: ObservableObject {
  var current: Binding<NavigationPath> { get }
}

enum MainFeature {
  case contractionCounter
}
