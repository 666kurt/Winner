import SwiftUI

struct BackgroundModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 15)
            .background(Color.theme.background.mainBackground).ignoresSafeArea()
    }
}

extension View {
    func backgroundModifier() -> some View {
        self.modifier(BackgroundModifier())
    }
}
