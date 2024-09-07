public protocol StorageManagerProtocol {
  func fetch<Request: DataRequestProtocol>(_ fetchStrategy: Request.Type) throws(StorageError) -> Request.Entity
  func fetch<SequenceRequest: DataSequenceRequestProtocol>(_ fetchStrategy: SequenceRequest.Type) throws(StorageError) -> SequenceRequest.Entity
}

public final class StorageManager: StorageManagerProtocol {
  
  @MainActor public static let coreData: CoreDataManagerProtocol = CoreDataManager()
  
  public func fetch<Request: DataRequestProtocol>(_ fetchStrategy: Request.Type) throws(StorageError) -> Request.Entity {
    try fetchStrategy.init(manager: self).fetch()
  }
  
  public func fetch<SequenceRequest: DataSequenceRequestProtocol>(_ fetchStrategy: SequenceRequest.Type) throws(StorageError) -> SequenceRequest.Entity {
    try fetchStrategy.init(manager: self).fetch()
  }
}


