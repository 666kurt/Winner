import SwiftUI

struct TabBarView: View {
    
    @Binding var selectedScreen: Screens
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        
        HStack {
            
            TabBarItem(image: "house.fill", 
                       title: "Home",
                       screen: .home,
                       selectedScreen: $selectedScreen)
            
            TabBarItem(image: "beats.headphones", 
                       title: "Music",
                       screen: .radio,
                       selectedScreen: $selectedScreen)
            
            Spacer()
                .frame(width: 80)
            
            
            TabBarItem(image: "heart.fill", 
                       title: "Health",
                       screen: .health,
                       selectedScreen: $selectedScreen)
            
            TabBarItem(image: "dumbbell.fill", 
                       title: "Training",
                       screen: .training,
                       selectedScreen: $selectedScreen)
            
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 7)
        .padding(.bottom, 36)
        .padding(.horizontal, 7)
        .background(Color(hex: "#151d2e"))
        .cornerRadius(37, corners: [.topLeft, .topRight])
        .ignoresSafeArea()
        .overlay(TabBarButton(action: {
            coordinator.toggleNewTraining()
        }).offset(y: -15))
        
    }
}

#Preview {
    MainView()
}
