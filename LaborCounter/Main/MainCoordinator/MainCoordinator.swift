import SwiftUI
import Combine

final class MainCoordinator: MainCoordinatorProtocol {
  var current: DidSet<MainFeature> = .init(wrappedValue: .contractionCounter)
  
//  init() {
//  }
}


protocol MainCoordinatorProtocol: ObservableObject {
  var current: DidSet<MainFeature> { get }
}


final class DidSet<Value> {
  private var value: Value
  private let subject: CurrentValueSubject<Value, Never>
  
  init(wrappedValue value: Value) {
    self.value = value
    self.subject = CurrentValueSubject(value)
    self.wrappedValue = value
  }
  
  var wrappedValue: Value {
    set {
      value = newValue
      subject.send(newValue)
    }
    get { value }
  }
  
  public var projectedValue: CurrentValueSubject<Value, Never> {
    get { subject }
  }
}

enum MainFeature {
  case contractionCounter
}
