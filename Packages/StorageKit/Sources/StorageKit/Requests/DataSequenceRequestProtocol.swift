public protocol DataSequenceRequestProtocol: DataRequestProtocol where Entity: Sequence {
  func fetch<T: Comparable>(sortedBy keyPath: KeyPath<Entity.Element, T>) throws(StorageError) -> Entity
}
