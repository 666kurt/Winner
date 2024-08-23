import SwiftUI

struct TabBarView: View {
    
    @Binding var selectedScreen: Screens
    
    var body: some View {
        
        HStack {
            
            TabBarItem(image: "house.fill", 
                       title: "Home",
                       screen: .home,
                       selectedScreen: $selectedScreen)
            
            TabBarItem(image: "radio.fill", 
                       title: "Radio",
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
        .background(Color.theme.background.secondBackground)
        .cornerRadius(37, corners: [.topLeft, .topRight])
        .ignoresSafeArea()
        .overlay(TabBarButton(action: {}).offset(y: -15))
        
    }
}

#Preview {
    MainView()
}
