import SwiftUI

struct NewTrainingCardView: View {
    
    @Binding var text: String
    let title: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            TextField("", text: $text)
                .font(.title.weight(.bold))
                .keyboardType(.numberPad)
            Text(title)
                .font(.subheadline)
        }
        .padding(4)
        .background(Color(hex: "#3898F3"))
        .frame(maxWidth: .infinity)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
