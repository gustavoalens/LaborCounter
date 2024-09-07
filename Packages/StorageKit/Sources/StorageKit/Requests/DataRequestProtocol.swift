public protocol DataRequestProtocol {
  associatedtype Entity
  init(manager: StorageManagerProtocol) throws(StorageError)
  func fetch() throws(StorageError) -> Entity
}
