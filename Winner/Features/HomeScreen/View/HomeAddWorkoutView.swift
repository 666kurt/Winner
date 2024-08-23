import SwiftUI

struct HomeAddWorkoutView: View {
    var body: some View {
        VStack(spacing: 0) {
            
            titleImageView
            
            VStack(spacing: 8) {
                Text("Add a workout")
                    .font(.title.weight(.bold))
                    .foregroundColor(Color.theme.text.whiteText)
                Text("Writing down goals increases the\neffectiveness of a workout by\n20%")
                    .multilineTextAlignment(.center)
                    .font(.subheadline)
                    .foregroundColor(Color.theme.text.grayText)
                
                Button {
                    // добавление тренировки
                } label: {
                    Text("Add")
                        .fontWeight(.bold)
                        .foregroundColor(Color.theme.text.whiteText)
                        .padding(.horizontal, 100)
                        .padding(.vertical, 11)
                        .background(Color.theme.other.primary)
                        .clipShape(Capsule())
                }
            }
            .padding(.vertical, 24)
            .frame(maxWidth: .infinity)
            .background(Color.theme.background.secondBackground)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.bottom, 40)
        }
    }
}

extension HomeAddWorkoutView {
    
    private var titleImageView: some View {
        HStack(alignment: .bottom) {
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Start")
                    .font(.caption)
                Text("Now")
                    .font(.largeTitle)
            }
            .foregroundColor(Color.theme.text.whiteText)
            .padding(.bottom, 15)
            
            Image("homeGirl")
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
    
}

#Preview {
    HomeAddWorkoutView()
        .padding()
        .backgroundModifier()
}
