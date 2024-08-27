import SwiftUI

struct TrainingScreen: View {
    
    @EnvironmentObject var coordinator: AppCoordinator
    @EnvironmentObject var trainingViewModel: TrainingViewModel
    @State private var isLandscape: Bool = false
    
    var body: some View {
        
        if isLandscape {
            ScrollView(showsIndicators: false) {
                content
            }
            .padding(.bottom, 100)
            .backgroundModifier()
            .orientationReader(isLandscape: $isLandscape)
        } else {
            content
                .backgroundModifier()
                .orientationReader(isLandscape: $isLandscape)
        }
        
    }
}

extension TrainingScreen {
    
    private var content: some View {
        ZStack {
            if trainingViewModel.trainings.isEmpty {
                addWorkoutView
            } else {
                
                VStack(spacing: 0) {
                    NavigationTitleView(title: "My training", subtitle: "To reach the goal, you must first go")
                    
                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: 14) {
                            ForEach(trainingViewModel.trainings, id: \.self) { training in
                                TrainingCardView(training: training)
                            }
                        }
                    }
                }
                .onAppear() {
                    trainingViewModel.fetchTrainings()
                }
            }
            
            if coordinator.showNewTraining {
                NewTrainingView()
            }
            
        }
    }
    
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
                coordinator.toggleNewTraining()
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
    MainView()
}
