import Foundation

public struct Contraction {
  public let id: Int
  public let start: Date
  public let end: Date
  public let count: TimeInterval
  public let diffFromlast: TimeInterval?
}
