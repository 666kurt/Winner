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
            .orientationReader(isLandscape: $isLandscape)
        } else {
            content
                .orientationReader(isLandscape: $isLandscape)
        }
        
    }
}

extension TrainingScreen {
    
    private var content: some View {
        ZStack {
            
            Image("trainingBG")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            if trainingViewModel.trainings.isEmpty {
                addWorkoutView
            } else {
                
                VStack(spacing: 0) {
                    NavigationTitleView(title: "My training", 
                                        subtitle: "To reach the goal, you must first go",
                                        haveButton: false,
                                        action: nil)
                    
                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: 14) {
                            ForEach(trainingViewModel.trainings, id: \.self) { training in
                                TrainingCardView(training: training)
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(.horizontal, 15)
                .onAppear() {
                    trainingViewModel.fetchTrainings()
                }
            }
            
            if coordinator.showNewTraining {
                NewTrainingView()
            }
            
        }
        .onTapGesture {
            UIApplication.shared.endEditing(true)
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
    TrainingScreen()
        .environmentObject(TrainingViewModel())
        .environmentObject(AppCoordinator.shared)
}
