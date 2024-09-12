import SwiftUI

struct StaticticsInputView: View {
    
    @Binding var text: String
    let title: String
    let subtitle: String
    let saveButton: () -> Void
    
    var body: some View {
        ZStack {
            
            Color.black.opacity(0.4).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                Text(title)
                    .font(.subheadline)
                    .padding(.top)
                    .padding(.bottom, 8)
                
                Text(subtitle)
                    .font(.footnote)
                    .foregroundColor(.theme.text.grayText)
                    .multilineTextAlignment(.center)
                    .padding([.bottom, .trailing, .leading])
                
                TextField("Text", text: $text)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 5.5)
                    .background(Color.theme.background.secondBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.theme.other.primary,
                                                                      lineWidth: 0.5), alignment: .center)
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                    .keyboardType(.numberPad)
                
                
                Button {
                    saveButton()
                } label: {
                    Text("Save")
                        .font(.headline).fontWeight(.semibold)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .foregroundColor(Color.theme.other.primary)
                        .padding(.vertical, 11)
                        .padding(.bottom, 8)
                }
            }
            .foregroundColor(Color.white)
            .zIndex(1)
            .frame(maxWidth: 270, alignment: .center)
            .background(Color(hex: "#151d2e"))
            .clipShape(RoundedRectangle(cornerRadius: 14))
        }
    }
}

#Preview {
    StaticticsInputView(text: .constant(""),
                        title: "Number of workouts per week",
                        subtitle: "To track progress",
                        saveButton: {})
    .backgroundModifier()
}
