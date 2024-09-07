@MainActor
protocol CounterStorageProtocol {
  func createNewContraction(data: ContractionModel)
}

final class CounterStorage: CounterStorageProtocol {
  private let manager: StorageManagerProtocol
  
  init(manager: StorageManagerProtocol) {
    self.manager = manager
  }
}
