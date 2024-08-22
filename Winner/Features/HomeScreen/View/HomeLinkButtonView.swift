import SwiftUI

struct HomeLinkButtonView: View {
    
    let image: String
    let title: String
    let url: String
    
    var body: some View {
        Link(destination: URL(string: url)!, label: {
            HStack(spacing: 20) {
                Image(systemName: image)
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color.theme.other.primary)
                Text(title)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(Color.theme.text.whiteText)
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.system(size: 16))
                    .foregroundColor(Color.theme.text.whiteText)
            }
            .padding(.vertical, 11)
            .padding(.horizontal, 26)
            .background(Color.theme.background.secondBackground)
            .clipShape(Capsule())
        })
    }
}

#Preview {
    HomeLinkButtonView(image: "list.clipboard.fill",
                       title: "Terms of use",
                       url: "https://google.com")
    .padding()
    .backgroundModifier()
}
