import SwiftUI

struct HomeScreen: View {
    
    @EnvironmentObject var coordinator: AppCoordinator
    @EnvironmentObject var homeViewModel: HomeViewModel
    @EnvironmentObject var healthViewModel: HealthViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                
                NavigationTitleView(title: "My training",
                                    subtitle: "To reach the goal, you must first go",
                                    haveButton: false,
                                    action: nil)
                
                staticticsView
                
                workoutTitleView
                
                if homeViewModel.trainings.isEmpty {
                    addWorkoutView
                } else {
                    trainingListView
                }
            }
            .backgroundModifier()
            .sheet(item: $coordinator.sheet) { sheet in
                coordinator.build(sheet: sheet)
            }
            
            if let form = coordinator.inputForm {
                coordinator.buildInputForm(form: form, homeVM: homeViewModel, healthVM: healthViewModel)
            }
        }
    }
}

extension HomeScreen {
    
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
                coordinator.present(sheet: .newTraining)
            } label: {
                Text("Add")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.theme.text.whiteText)
                    .padding(.vertical, 11)
                    .background(Color.theme.other.primary)
                    .clipShape(Capsule())
            }
        }
        .padding(10)
        .frame(maxWidth: .infinity)
        .background(Color.theme.background.secondBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .background(
            Image("homeGirl")
                .frame(maxWidth: .infinity, alignment: .trailing), alignment: .bottom)
    }
    
    private var staticticsView: some View {
        HStack(spacing: 20) {
            HomeStaticticsCardView(title: "Number of workouts per week",
                                   value: homeViewModel.goalWorkout,
                                   action: {
                coordinator.presentInputForm(inputForm: .goalWorkout)
            })
            HomeStaticticsCardView(title: "Weight",
                                   value: homeViewModel.goalHeight,
                                   action: {
                coordinator.presentInputForm(inputForm: .goalWeight)
            })
        }
    }
    
    private var workoutTitleView: some View {
        Text("Workout")
            .font(.largeTitle.weight(.bold))
            .foregroundColor(.theme.text.whiteText)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 30)
    }
    
    private var trainingListView: some View {
        ZStack(alignment: .bottom) {
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 14) {
                    ForEach(homeViewModel.trainings, id: \.self) { training in
                        TrainingCardView(training: training)
                    }
                }
            }
            .padding(.bottom, 150)
            
            Text("Add a workout")
                .fontWeight(.bold)
                .foregroundColor(Color.theme.text.whiteText)
                .padding(.vertical, 11)
                .frame(maxWidth: .infinity)
                .background(Color.theme.other.primary)
                .clipShape(Capsule())
                .offset(y: -100)
                .onTapGesture {
                    coordinator.present(sheet: .newTraining)
                }
        }
    }
    
}

#Preview {
    HomeScreen()
        .environmentObject(HomeViewModel())
        .environmentObject(HealthViewModel())
        .environmentObject(AppCoordinator.shared)
}
