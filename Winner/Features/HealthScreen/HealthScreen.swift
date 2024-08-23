import SwiftUI

struct HealthScreen: View {
    
    var body: some View {
        VStack(spacing: 0) {
            
            NavigationTitleView(title: "My health",
                                subtitle: "9/10 of our happiness depends on health")
            
            VStack(spacing: 8) {
                HealthCardView(isLeading: false,
                               title: "Height",
                               image: "height")
                HealthCardView(isLeading: true,
                               title: "Weight",
                               image: "weight")
                HealthCardView(isLeading: false,
                               title: "Pulse",
                               image: "pulse")
                HealthCardView(isLeading: true,
                               title: "Body girths",
                               image: "body")
            }
            
        }
        .backgroundModifier()
    }
    
}

#Preview {
    HealthScreen()
}
