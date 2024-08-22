import SwiftUI

struct HomeResetProgressButton: View {
    
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Image(systemName: "arrow.clockwise")
                    .font(.system(size: 20))
                Text("Reset progress")
                    .font(.system(size: 15, weight: .semibold))
            }
            .foregroundColor(Color.theme.text.whiteText)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 11)
            .background(Color.theme.other.primary)
            .clipShape(Capsule())
        }
    }
}

#Preview {
    HomeResetProgressButton(action: {})
        .padding()
}
