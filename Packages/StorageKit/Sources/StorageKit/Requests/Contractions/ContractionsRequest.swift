import CoreData
import EntitiesKit

public final class ContractionsRequest: DataSequenceRequestProtocol {
  private let manager: CoreDataManagerProtocol
  public init(manager: StorageManagerProtocol) throws(StorageError) {
    guard let manager = manager as? CoreDataManagerProtocol else {
      throw .storageDontRecognizeFetch
    }
    self.manager = manager
  }
  
//  public var entityId: String { "ContractionBase" }
  public func fetch() throws(StorageError) -> [Contraction] {
    throw .notImplemented
  }
  
  // TODO: o que fazer com EntitiesKit? Tudo nesse kit?
  
  public func fetch<T>(sortedBy keyPath: KeyPath<Contraction, T>) throws(StorageError) -> [Contraction] where T : Comparable {
    let request = Contraction.fetchRequest()
    request.sortDescriptors = [NSSortDescriptor(keyPath: keyPath, ascending: true)]
    do {
      return try manager.container.viewContext.fetch(request)
    } catch {
      throw .managerContainerError
    }
  }
}
