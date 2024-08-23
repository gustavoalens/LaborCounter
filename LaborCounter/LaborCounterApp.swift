import SwiftUI
import LaunchingKit

@main
struct LaborCounterApp: App {
  let persistenceController = PersistenceController.shared
  
  var body: some Scene {
    WindowGroup {
      LaunchingView { MainCoordinator().start() }
    }
  }
}

#Preview {
  LaunchingView { MainCoordinator().start() }
}
