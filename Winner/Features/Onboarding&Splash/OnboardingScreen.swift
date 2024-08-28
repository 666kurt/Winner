import SwiftUI

struct OnboardingScreen: View {
    
    @Binding var showOnboarding: Bool
    @State private var currentTab = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                
                Color(hex: "#002235").ignoresSafeArea()
                
                TabView(selection: $currentTab) {
                    
                    Image("onboarding1")
                        .resizable()
                        .scaledToFill()
                        .tag(0)
                    
                    Image("onboarding2")
                        .resizable()
                        .scaledToFill()
                        .tag(1)
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .ignoresSafeArea()
                
                VStack(spacing: 16) {
                    
                    Button(action: {
                        if currentTab < 1 {
                            currentTab += 1
                        } else {
                            showOnboarding = false
                            UserDefaults.standard.set(true, forKey: "hasSeenOnboarding")
                        }
                    }, label: {
                        Text("Next")
                            .bold()
                            .padding(.vertical, 17)
                            .foregroundColor(.theme.text.mainText)
                            .frame(maxWidth: geometry.size.width)
                            .background(Color.theme.text.whiteText)
                            .clipShape(Capsule())
                    })
                    
                    CustomTabIndicator(currentTab: $currentTab, numberOfTabs: 2)
                }
                .padding(.horizontal, 15)
            }
        }
    }
}


#Preview {
    OnboardingScreen(showOnboarding: .constant(true))
}
