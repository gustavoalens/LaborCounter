import NavUI
import SwiftUI

public final class ContractionCounterBuilder {
  @MainActor public static func start(navigation: Navigation) -> some View {
    let coordinator = ContractionCounterCoordinator(navigation: navigation)
    let storage = ContractionCounterStorageMock() // ContractionCounterStorage(manager: storage.shared)
    let viewModel = ContractionCounterViewModel(
      coordinator: coordinator,
      storage: storage
    )
    return ContractionCounterView(viewModel: viewModel)
  }
}
