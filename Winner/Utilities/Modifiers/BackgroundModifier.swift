import SwiftUI

struct BackgroundModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        
        ZStack {
            Color(hex: "#031845").ignoresSafeArea()
            
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(.horizontal, 15)
        }
    }
}

extension View {
    func backgroundModifier() -> some View {
        self.modifier(BackgroundModifier())
    }
}
