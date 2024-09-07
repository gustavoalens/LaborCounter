import SwiftUI
import Combine

protocol CounterViewModelProtocol: ObservableObject {
  var viewObject: CounterViewObject { get set }
  
  func start()
  func stop()
}

final class CounterViewModel: CounterViewModelProtocol {
  @Published var viewObject: CounterViewObject = .init()
  private let counter: Counter = .init()
  private var startDate: Date = Date.now
  private var interval: TimeInterval = .zero
  private let storage: ContractionCounterStorageProtocol
  
  func start() {
    startDate = counter.start { [weak self] seconds in
      self?.updateTime(range: seconds)
    }
    updateTime(range: 0)
  }
  
  func stop() {
    let finalDate = counter.stop()
    
  }
  
  private func updateTime(range: TimeInterval) {
    viewObject.balanceReference = min((range / 60) - 1, 1)
    let ref = modf(range / 60)
    viewObject.timer = String(format: "%02d:%02d", Int(ref.0), Int(ref.1 * 60))
    interval =  range
  }
}

final class Counter {
  
  private var timerCancellable: AnyCancellable?
  private var startDate: Date = Date()
  
  @discardableResult
  func start(updating: @escaping (_ seconds: TimeInterval) -> Void) -> Date {
    startDate = Date.now
    timerCancellable = Timer.publish(every: 1, on: .main, in: .default)
      .autoconnect()
      .receive(on: DispatchQueue.main)
      .sink(receiveValue: { [weak self] time in
        guard let self = self else { return }
        let result = time.timeIntervalSince(self.startDate)
        updating(result)
      })
    
    return startDate
  }
  
  @discardableResult
  func stop() -> Date {
    timerCancellable?.cancel()
    return Date.now
  }
}
