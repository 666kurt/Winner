import SwiftUI

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
    
    @EnvironmentObject var coordinator: AppCoordinator
    @EnvironmentObject var homeViewModel: HomeViewModel
    
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
                
                //                ZStack {
                //                    Image("circleArrow")
                //                        .resizable()
                //                        .frame(width: 52, height: 48)
                //
                //                    VStack {
                //                        Text("\(training.timestamp)")
                //                        Text("Min")
                //                    }
                //                    .font(.caption)
                //                    .foregroundColor(.theme.text.whiteText)
                //                    .padding(.leading, 4)
                //                }
            }
            
            HStack {
                TrainingCardInfoView(title: "Approaches",
                                     value: training.approaches)
                TrainingCardInfoView(title: "Repetitions",
                                     value: training.repetitions)
                TrainingCardInfoView(title: "Weight",
                                     value: training.weight)
            }
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.theme.background.secondBackground)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Description")
                    .font(.callout.weight(.semibold))
                Text(training.details)
                    .font(.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.theme.text.whiteText)
        }
        .padding(20)
        .frame(maxWidth: .infinity)
        .background(Color.theme.background.secondBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .onTapGesture {
            homeViewModel.setCurrentTraining(training)
            coordinator.present(sheet: .editTrainig)
        }
        .sheet(item: $coordinator.sheet) { sheet in
            coordinator.build(sheet: sheet)
        }
    }
}

#Preview {
    MainView()
}
