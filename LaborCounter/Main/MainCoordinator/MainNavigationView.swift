import SwiftUI

struct MainNavigationView<Coordinator: MainCoordinatorProtocol>: View {
  
  @StateObject var coordinator: Coordinator
    var body: some View {
      NavigationStack {
        
      }
      .navigationDestination(for: MainFeature.self) { feature in
        switch feature {
          case .contractionCounter:
            
        }
      }
    }
}

#Preview {
  NavigationAppView(coordinator: MainCoordinator())
}
