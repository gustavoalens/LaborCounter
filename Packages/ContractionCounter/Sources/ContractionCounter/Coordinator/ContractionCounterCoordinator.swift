import SwiftUI
import Combine

final class ContractionCounterCoordinator: MainCoordinatorProtocol {
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
  
  func build() -> AnyView {
    return AnyView(Text("Initial test"))
  }
  
  
}


protocol MainCoordinatorProtocol: ObservableObject {
  var current: Binding<NavigationPath> { get }
  
  func build() -> AnyView
}

enum MainFeature {
  case contractionCounter
}
