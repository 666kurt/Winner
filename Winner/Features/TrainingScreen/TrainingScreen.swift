import SwiftUI

struct TrainingScreen: View {
    
    let trainings: [Training] = [
        Training(name: "Barbell Squats",
                 approaches: "5",
                 repetitions: "8",
                 weight: "50",
                 time: "15",
                 description: "Maximum load on the legs and buttocks, rest time 1 min"),
        Training(name: "Barbell Squats",
                 approaches: "5",
                 repetitions: "8",
                 weight: "50",
                 time: "15",
                 description: "Maximum load on the legs and buttocks, rest time 1 min"),
        Training(name: "Barbell Squats",
                 approaches: "5",
                 repetitions: "8",
                 weight: "50",
                 time: "15",
                 description: "Maximum load on the legs and buttocks, rest time 1 min"),
        Training(name: "Barbell Squats",
                 approaches: "5",
                 repetitions: "8",
                 weight: "50",
                 time: "15",
                 description: "Maximum load on the legs and buttocks, rest time 1 min"),
        Training(name: "Barbell Squats",
                 approaches: "5",
                 repetitions: "8",
                 weight: "50",
                 time: "15",
                 description: "Maximum load on the legs and buttocks, rest time 1 min")
    ]
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            //  Если тренировок нет
            //  addWorkoutView
            
            
            //  Если тренировки есть
            NavigationTitleView(title: "My training", subtitle: "To reach the goal, you must first go")
            
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 14) {
                    ForEach(trainings, id: \.id) { training in
                        TrainingCardView(training: training)
                    }
                }
            }
        }
        .backgroundModifier()
        
    }
}

extension TrainingScreen {
    
    private var addWorkoutView: some View {
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
        .frame(maxHeight: .infinity)
        
    }
    
}

#Preview {
    TrainingScreen()
}
