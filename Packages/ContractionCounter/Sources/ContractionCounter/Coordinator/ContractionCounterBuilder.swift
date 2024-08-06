import NavUI
import SwiftUI

public final class ContractionCounterBuilder {
  public static func start(navigation: Navigation) -> some View {
    let coordinator = ContractionCounterCoordinator(navigation: navigation)
    let viewModel = ContractionCounterViewModel(coordinator: coordinator)
    return ContractionCounterView(viewModel: viewModel)
  }
}
