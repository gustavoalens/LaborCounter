protocol ContractionCounterStorageProtocol {
  func fetchContractions() async throws(ContractionCounterStorageError) -> ContractionModel
}

//final class ContractionCounterStorage: ContractionCounterStorageProtocol {
//  
//}

final class ContractionCounterStorageMock: ContractionCounterStorageProtocol {
  func fetchContractions() async throws(ContractionCounterStorageError) -> ContractionModel  {
    let mockResult = Task {
      try await Task.sleep(nanoseconds: 1_000_000_000)
      return ContractionModel(contractions: [
        .init(id: 0, start: .now, end: .now),
        .init(id: 1, start: .now, end: .now),
        .init(id: 2, start: .now, end: .now),
      ])
    }
    guard let result = try? await mockResult.value else {
      throw .noData
    }
    return result
  }
}

enum ContractionCounterStorageError: Error {
  case noData
  case unkown
}
