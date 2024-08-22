import SwiftUI

struct HealthScreen: View {
    
    var body: some View {
        VStack {
            Text("HealthScreen")
                .font(.title)
                .foregroundColor(.white)
        }
        .backgroundModifier()
    }
    
}

#Preview {
    HealthScreen()
}
