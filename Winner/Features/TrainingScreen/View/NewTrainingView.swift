import SwiftUI

struct NewTrainingView: View {
    
    @EnvironmentObject var trainingViewModel: TrainingViewModel
    @EnvironmentObject var coordinator: AppCoordinator
    
    @State private var isVisible: Bool = false
    
    var body: some View {
        VStack(spacing: 12) {
            
            nameTextFieldView
            
            cardsTextFieldView
            
            descriptionTextFieldView
            
            addTrainingButtonView
            
        }
        .padding(20)
        .foregroundColor(.theme.text.whiteText)
        .background(Color.theme.other.primary)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .sheet(isPresented: $coordinator.showTimePickerSheet) {
            TimePickerSheet(minutes: $trainingViewModel.time)
        }
        .offset(y: isVisible ? 0 : UIScreen.main.bounds.height)
        .animation(.spring(), value: isVisible)
        .onAppear {
            withAnimation {
                self.isVisible = true
            }
        }
        .onDisappear {
            withAnimation {
                self.isVisible = false
            }
        }
        .padding(.horizontal, 15)
        .offset(y: -(UIScreen.main.bounds.height * 0.2))

    }
    
    private var isDisable: Bool {
        return !trainingViewModel.name.isEmpty &&
        !trainingViewModel.approaches.isEmpty &&
        !trainingViewModel.repetitions.isEmpty &&
        !trainingViewModel.weight.isEmpty &&
        !trainingViewModel.description.isEmpty &&
        trainingViewModel.time != 0
    }
}

extension NewTrainingView {
    
    private var nameTextFieldView: some View {
        HStack {
            ZStack(alignment: .leading) {
                if trainingViewModel.name.isEmpty {
                    Text("Name")
                }
                TextField("", text: $trainingViewModel.name)
                
            }
            .font(.title2)
            .padding(4)
            .background(Color(hex: "#3898F3"))
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            ZStack {
                Image("circleArrow")
                    .resizable()
                    .frame(width: 52, height: 48)
                
                Text(trainingViewModel.time == 0
                     ? "Time"
                     : "\(trainingViewModel.time)\nMin")
                .font(.caption)
                .foregroundColor(.theme.text.whiteText)
                .multilineTextAlignment(.center)
                .padding(.leading, 5)
                .onTapGesture {
                    coordinator.toggleSheet()
                }
            }
        }
    }
    
    private var cardsTextFieldView: some View {
        HStack() {
            NewTrainingCardView(text: $trainingViewModel.approaches,
                                title: "Approaches")
            
            NewTrainingCardView(text: $trainingViewModel.repetitions,
                                title: "Repetitions")
            
            NewTrainingCardView(text: $trainingViewModel.weight,
                                title: "Weight")
        }
    }
    
    private var descriptionTextFieldView: some View {
        VStack(alignment: .leading) {
            Text("Description")
            TextField("", text: $trainingViewModel.description)
        }
        .padding(4)
        .background(Color(hex: "#3898F3"))
        .frame(maxWidth: .infinity, alignment: .leading)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    private var addTrainingButtonView: some View {
        Button {
            trainingViewModel.addTraining()
            coordinator.toggleNewTraining()
        } label: {
            Text("Add")
                .padding(11)
                .font(.system(size: 14, weight: .semibold))
                .frame(maxWidth: .infinity)
                .foregroundColor(.theme.text.mainText)
                .background(isDisable ? Color.theme.other.primaryWhite :
                                Color.theme.other.secondary
                )
                .clipShape(Capsule())
        }.disabled(!isDisable)
    }
    
}

#Preview {
    NewTrainingView()
        .environmentObject(TrainingViewModel())
        .environmentObject(AppCoordinator.shared)
        .padding()
}
