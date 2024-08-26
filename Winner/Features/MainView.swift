import SwiftUI

struct MainView: View {
    
    @StateObject var coordinator = AppCoordinator.shared
    @StateObject var trainingViewModel = TrainingViewModel()
    @StateObject var healthViewModel = HealthViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
    
            switch coordinator.selectedScreen {
            case .home:
                HomeScreen()
                    .environmentObject(trainingViewModel)
            case .radio:
                RadioScreen()
            case .health:
                HealthScreen()
                    .environmentObject(healthViewModel)
            case .training:
                TrainingScreen()
                    .environmentObject(trainingViewModel)
            }
            
            TabBarView(selectedScreen: $coordinator.selectedScreen)
            
        }
        .environmentObject(coordinator)
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    MainView()
}
