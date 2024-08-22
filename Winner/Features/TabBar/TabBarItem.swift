import SwiftUI

struct TabBarItem: View {
    
    let image: String
    let title: String
    let screen: Screens
    @Binding var selectedScreen: Screens
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: image)
                .font(.system(size: 24))
            Text(title)
                .font(.caption)
        }
        .foregroundColor(selectedScreen == screen
                         ? Color.theme.other.primary
                         : Color.theme.text.tabText
        )
        .frame(maxWidth: .infinity)
        .onTapGesture {
            selectedScreen = screen
        }
    }
}

#Preview {
    MainView()
}
