import SwiftUI

struct Training: Identifiable {
    var id = UUID()
    let name: String
    let approaches: String
    let repetitions: String
    let weight: String
    let time: String
    let description: String
}

struct TrainingCardInfoView: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(value)
                .font(.title.weight(.bold))
                .foregroundColor(.theme.text.mainText)
                .shadow(color: Color(hex: "#4ADEFF").opacity(0.25),
                        radius: 4)
                .frame(width: 70)
                .lineLimit(1)
            Text(title)
                .font(.subheadline)
                .foregroundColor(.theme.text.whiteText)
        }
        .frame(maxWidth: .infinity)
    }
}

struct TrainingCardView: View {
    
    let training: Training
    
    var body: some View {
        
        VStack(spacing: 12) {
            
            HStack {
                Text(training.name)
                    .font(.title2)
                    .foregroundColor(.theme.text.whiteText)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(1)
                
                Spacer()
                
                ZStack {
                    Image("circleArrow")
                        .resizable()
                        .frame(width: 52, height: 48)
                    
                    VStack {
                        Text(training.time)
                        Text("Min")
                    }
                    .font(.caption)
                    .foregroundColor(.theme.text.whiteText)
                    .padding(.leading, 4)
                }
            }
            
            HStack {
                TrainingCardInfoView(title: "Approaches",
                                     value: "44")
                TrainingCardInfoView(title: "Repetitions",
                                     value: "12")
                TrainingCardInfoView(title: "Weight",
                                     value: "220")
            }
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.theme.background.secondBackground)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Description")
                    .font(.callout.weight(.semibold))
                Text(training.description)
                    .font(.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.theme.text.whiteText)
        }
        .padding(20)
        .frame(maxWidth: .infinity)
        .background(Color.theme.background.secondBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        
    }
}

#Preview {
    TrainingCardView(training: Training(name: "Barbell Squats",
                                        approaches: "5",
                                        repetitions: "8",
                                        weight: "50",
                                        time: "15",
                                        description: "Maximum load on the legs and buttocks, rest time 1 min"))
    .padding()
    .backgroundModifier()
}
