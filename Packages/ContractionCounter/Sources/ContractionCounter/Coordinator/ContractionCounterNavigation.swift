import SwiftUI

struct ContractionCounterNavigation<RootView: View, Coordinator: ContractionCounterCoordinatorProtocol>: View {
  let rootView: RootView
  
  @StateObject var coordinator: Coordinator
    var body: some View {
      NavigationStack(path: coordinator.current) {
        rootView
      }
    }
}

#Preview {
  ContractionCounterNavigation(
    rootView: Text("NavigationTest"),coordinator: ContractionCounterCoordinator(path: .init())
  )
}

public final class ContractionCounterComposer {
  public static func start(path: NavigationPath) -> AnyView {
    let coordinator = ContractionCounterCoordinator(path: path)
    let viewModel = ContractionCounterViewModel(coordinator: coordinator)
    return AnyView(ContractionCounterNavigation(rootView: ContractionCounterView(viewModel: viewModel), coordinator: coordinator))
  }
}


// TODO: Organizes files
