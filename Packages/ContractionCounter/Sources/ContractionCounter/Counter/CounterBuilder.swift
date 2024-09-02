import SwiftUI

public final class CounterBuilder {
  @MainActor public static func getView() -> some View {
    let viewModel = CounterViewModel()
    return CounterView(viewModel: viewModel)
  }
}
