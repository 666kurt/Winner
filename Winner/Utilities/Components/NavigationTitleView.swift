import SwiftUI

struct NavigationTitleView: View {
    
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.largeTitle.weight(.bold))
                .foregroundColor(.theme.text.whiteText)
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.theme.text.grayText)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 24)
    }
}

#Preview {
    NavigationTitleView(title: "My training", subtitle: "To reach the goal, you must first go")
        .backgroundModifier()
}
