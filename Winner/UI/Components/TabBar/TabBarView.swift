import SwiftUI

struct TabBarView: View {
    
    @Binding var selectedScreen: Screens
    
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
            
            TabBarItem(image: "heart.fill", 
                       title: "Health",
                       screen: .health,
                       selectedScreen: $selectedScreen)
            
            TabBarItem(image: "gearshape.fill",
                       title: "Settings",
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
        
    }
}

#Preview {
    MainView()
}
