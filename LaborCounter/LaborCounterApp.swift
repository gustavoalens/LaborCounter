import SwiftUI

@main
struct LaborCounterApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
          MainNavigationView(coordinator: MainCoordinator(path: .init()))
        }
    }
}
