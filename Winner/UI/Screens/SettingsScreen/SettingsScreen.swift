import SwiftUI

struct SettingsScreen: View {
    
    @EnvironmentObject private var coordinator: AppCoordinator
    @EnvironmentObject private var healthViewModel: HealthViewModel
    @EnvironmentObject private var homeViewModel: HomeViewModel

    
    var body: some View {
        ZStack {
            VStack {
                
                NavigationTitleView(title: "Settings", subtitle: "", haveButton: false, action: {})
                
                linksView
                
            }
            .backgroundModifier()
            
            if coordinator.deleteDataAlert {
                AlertView(showAlert: $coordinator.deleteDataAlert, onReset: {
                    healthViewModel.deleteAllData()
                    homeViewModel.deleteAllData()
                })
            }
        }
    }
}

extension SettingsScreen {
    
    private var linksView: some View {
        VStack(spacing: 15) {
            SettingsLinkButtonView(image: "list.clipboard.fill",
                               title: "Terms of use",
                               url: "https://www.termsfeed.com/live/8563bc48-89c4-4abc-a5e7-2b9f45375323")
    
            SettingsLinkButtonView(image: "shield.fill",
                               title: "Privacy",
                               url: "https://www.termsfeed.com/live/d69ab979-680f-444c-a30c-8bde3fbf7f39")
    
            SettingsLinkButtonView(image: "ellipsis.message.fill",
                               title: "Contact us",
                               url: "https://www.termsfeed.com/live/8563bc48-89c4-4abc-a5e7-2b9f45375323")
    
            SettingsResetProgressButton(action: {
                coordinator.toggleDataAlert()
            })
        }
    }
    
}

#Preview {
    SettingsScreen()
        .environmentObject(HealthViewModel())
        .environmentObject(HomeViewModel())
        .environmentObject(AppCoordinator.shared)
}
