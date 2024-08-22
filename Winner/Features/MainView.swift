import SwiftUI

struct MainView: View {
    
    @ObservedObject private var coordinator = AppCoordinator.shared
    
    var body: some View {
        ZStack(alignment: .bottom) {
    
            switch coordinator.selectedScreen {
            case .home:
                HomeScreen()
            case .radio:
                RadioScreen()
            case .health:
                HealthScreen()
            case .training:
                TrainingScreen()
            }
            
            TabBarView(selectedScreen: $coordinator.selectedScreen)
            
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    MainView()
}
