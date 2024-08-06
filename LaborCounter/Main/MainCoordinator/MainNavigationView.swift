//import SwiftUI
//import ContractionCounter
//
//struct MainNavigationView<Coordinator: MainCoordinatorProtocol>: View {
//  
//  @StateObject var coordinator: Coordinator
//    var body: some View {
//      NavigationStack(path: $coordinator.path) {
//        coordinator.build()
//          .navigationDestination(for: MainFeature.self) { feature in
//            switch feature {
//              case .contractionCounter:
//                ContractionCounterComposer.start(path: coordinator.path)
//            }
//          }
//      }
//      .environmentObject(coordinator)
//    }
//}
//
//#Preview {
//  MainNavigationView(coordinator: MainCoordinator(path: NavigationPath()))
//}
