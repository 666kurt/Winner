import SwiftUI

struct HomeStaticticsCardView: View {
    
    let title: String
    let value: String
    let action: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            Text(title)
                .foregroundColor(.white)
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 36, alignment: .top)
            Spacer()
            Text(value)
                .font(.largeTitle.weight(.bold))
                .foregroundColor(.theme.text.grayText)
            Spacer()
            Button {
                action()
            } label: {
                Text("Edit")
                    .padding(5)
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 14, weight: .bold))
                    .background(Color.theme.text.grayText)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }
        }
        .padding(10)
        .padding(.top, 8)
        .frame(height: 150, alignment: .top)
        .background(Color.theme.background.secondBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.bottom, 20)
    }
}

#Preview {
    HomeStaticticsCardView(title: "Number of workouts per week",
                           value: "0",
                           action: {})
    .backgroundModifier()
}
