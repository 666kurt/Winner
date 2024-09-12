import SwiftUI

struct NavigationTitleView: View {
    
    let title: String
    let subtitle: String
    let haveButton: Bool
    let action: (() -> Void)?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(title)
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.theme.text.whiteText)
                
                Spacer()
                
                if haveButton {
                    Button {
                        action!()
                    } label: {
                        Image(systemName: "arrow.clockwise")
                            .foregroundColor(.theme.text.whiteText)
                            .font(.title2.weight(.bold))
                    }
                }
                
            }
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.theme.text.grayText)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 14)
    }
}

#Preview {
    NavigationTitleView(title: "My training", subtitle: "To reach the goal, you must first go", haveButton: true, action: {})
        .backgroundModifier()
}
