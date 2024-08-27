import SwiftUI

struct HomeScreen: View {
    
    @EnvironmentObject var coordinator: AppCoordinator
    @EnvironmentObject var healthViewModel: HealthViewModel
    @EnvironmentObject var trainingViewModel: TrainingViewModel
    @State private var isLandscape: Bool = false
    
    var body: some View {
        
        if isLandscape {
            ScrollView(showsIndicators: false) {
                content
            }
            .padding(.bottom, 100)
            .backgroundModifier()
            .orientationReader(isLandscape: $isLandscape)
        } else {
            content
                .orientationReader(isLandscape: $isLandscape)
        }
        
    }
    
}

extension HomeScreen {
    
    private var content: some View {
        ZStack {
            VStack(spacing: 0) {
                titleImageView
                HomeAddWorkoutView()
                linksView
            }
            .backgroundModifier()
            
            if coordinator.showAlert {
                AlertView(showAlert: $coordinator.showAlert,
                          onReset: {
                    healthViewModel.deleteAllData()
                    trainingViewModel.deleteAllData()
                })
            }
        }
    }
    
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
            
            HomeResetProgressButton(action: {
                coordinator.toggleAlert()
            })
        }
    }
    
}

#Preview {
    MainView()
}
