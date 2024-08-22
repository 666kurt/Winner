import SwiftUI

struct TabBarButton: View {
    
    let action: () -> Void
    
    var body: some View {
    
        Image(systemName: "plus")
            .resizable()
            .frame(width: 35, height: 35)
            .foregroundColor(.black)
            .padding(14)
            .background(
                Circle()
                    .foregroundColor(Color.theme.other.primary)
                    .shadow(color: Color.theme.other.primary,
                            radius: 6)
            )
            .frame(maxWidth: .infinity)
            .onTapGesture {
                action()
            }
            .offset(y: -7)
    }
}

#Preview {
    MainView()
}
