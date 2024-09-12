import SwiftUI

struct HealthCardView: View {
    
    let title: String
    let value: String
    let image: String
    let action: () -> Void
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.title2)
            
            Text(value)
                .font(.subheadline)
                .foregroundColor(.theme.other.primary)
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 20)
        .foregroundColor(.theme.text.whiteText)
        .frame(maxWidth: .infinity,
               alignment: .leading)
        .frame(height: 110)
        .background(Color.theme.background.secondBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .background(Image(image).opacity(0.5)
            .scaledToFit(),
                    alignment: .bottomTrailing)
        .onTapGesture {
            action()
        }
        
    }
}

#Preview {
    HealthCardView(title: "Height",
                   value: "no data",
                   image: "height",
                   action: {})
    .backgroundModifier()
}
