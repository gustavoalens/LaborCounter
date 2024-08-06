import SwiftUI

@main
struct LaborCounterApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
          MainCoordinator().start()
        }
    }
}
