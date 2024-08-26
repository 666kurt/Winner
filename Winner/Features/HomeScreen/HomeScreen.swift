import SwiftUI

struct HomeScreen: View {
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            titleImageView
            
            HomeAddWorkoutView()
            
            linksView
            
        }
        .backgroundModifier()
    }
    
}

extension HomeScreen {
    
    private var titleImageView: some View {
        HStack(alignment: .bottom) {
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Start")
                    .font(.caption)
                Text("Now")
                    .font(.largeTitle)
            }
            .foregroundColor(Color.theme.text.whiteText)
            .padding(.bottom, 15)
            
            Image("homeGirl")
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
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
