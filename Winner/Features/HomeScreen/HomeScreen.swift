import SwiftUI

struct HomeScreen: View {
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
                   
            VStack(spacing: 0) {
                
                titleView
            
                HomeAddWorkoutView()
                
                linksView
                
            }
            .backgroundModifier()
            
//            Image("homeGirl")
        }
    }
    
}

extension HomeScreen {
    
    private var titleView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Start")
                .font(.caption)
            Text("Now")
                .font(.largeTitle)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(Color.theme.text.whiteText)
        .padding(.bottom, 15)
    }
    
    private var linksView: some View {
        VStack(spacing: 15) {
            HomeLinkButtonView(image: "list.clipboard.fill",
                               title: "Terms of use",
                               url: "https://google.com")
            
            HomeLinkButtonView(image: "shield.fill",
                               title: "Privacy",
                               url: "https://google.com")
            
            HomeLinkButtonView(image: "ellipsis.message.fill",
                               title: "Contact us",
                               url: "https://google.com")
            
            HomeResetProgressButton(action: {})
        }
    }
    
}

#Preview {
    MainView()
}
