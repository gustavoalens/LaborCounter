import SwiftUI
import Combine

final class MainCoordinator: MainCoordinatorProtocol {
  @Published var path: NavigationPath = .init()
  
  init(path: NavigationPath) {
    self.path = path
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) { // TODO: Remove force test
      self.path.append(MainFeature.contractionCounter)
    }
  }
  
  func build() -> AnyView {
    return AnyView(Text("Initial test"))
  }
  
  
}


protocol MainCoordinatorProtocol: ObservableObject {
  var path: NavigationPath { get set }
  
  func build() -> AnyView
}

enum MainFeature {
  case contractionCounter
}

// TODO: Organizes files and add composer to main
