import SwiftUI

struct TextFieldView: View {
    let title: String
    @Binding var text: String
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 15) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(Color.black)
            
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text("Value")
                        .font(.callout)
                        .foregroundColor(.black.opacity(0.3))
                }
                TextField("", text: $text)
                
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .foregroundColor(Color.black)
        .background(Color.white.opacity(0.45))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    TextFieldView(title: "Name",
                  text: .constant(""))
    .backgroundModifier()
}
