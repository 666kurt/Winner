import SwiftUI

struct MainView: View {
    
    @StateObject var coordinator = AppCoordinator.shared
    @StateObject var trainingViewModel = HomeViewModel()
    @StateObject var healthViewModel = HealthViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
                switch coordinator.selectedScreen {
            case .home:
                HomeScreen()
                    .environmentObject(trainingViewModel)
                    .environmentObject(healthViewModel)
            case .radio:
                MusicScreen()
            case .health:
                HealthScreen()
                    .environmentObject(healthViewModel)
                    .environmentObject(trainingViewModel)
            case .training:
                SettingsScreen()
                    .environmentObject(trainingViewModel)
                    .environmentObject(healthViewModel)
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
