import SwiftUI
import Foundation

protocol ContractionCounterViewModelProtocol: ObservableObject, AnyObject {
  var viewObject: ContractionCounterViewObject { get }
}

@MainActor
final class ContractionCounterViewModel: @preconcurrency ContractionCounterViewModelProtocol {
  private let coordinator: any ContractionCounterCoordinatorProtocol
  private let storage: ContractionCounterStorageProtocol
  
  @Published var viewObject: ContractionCounterViewObject = .init(data: [])
  @Published var isLoading: Bool = false
  
  init(
    coordinator: any ContractionCounterCoordinatorProtocol,
    storage: ContractionCounterStorageProtocol
  ) {
    self.coordinator = coordinator
    self.storage = storage
    fetchStorage()
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
      self.viewObject.data.insert(.init(id: 5, start: "start", end: "end", duration: "dur"), at: 0)
    }
  }
  
  private func fetchStorage() {
    Task {
      do throws(ContractionCounterStorageError) {
        isLoading = true
        let contractions = try await storage.fetchContractions()
        updateViewObject(withContractions: contractions.contractions)
      } catch {
        switch error {
          case .noData:
            // TODO: handle data
            break
            
          case .unkown:
            // TODO: handle data
            break
        }
      }
      isLoading = false
    }
  }
  
  private func updateViewObject(withContractions contractions: [Contraction]) {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"
    viewObject.data = contractions.map({ contraction in
        .init(id: contraction.id, start: formatter.string(from: contraction.start), end: formatter.string(from: contraction.end), duration: "\(contraction.end.timeIntervalSince1970 - contraction.start.timeIntervalSince1970)")
    })
  }
  
}
