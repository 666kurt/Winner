import SwiftUI

struct NewTrainingView: View {
    
    @EnvironmentObject var trainingViewModel: TrainingViewModel
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        VStack(spacing: 12) {
            
            nameTextFieldView
            
            cardsTextFieldView
            
            descriptionTextFieldView
            
            addTrainingButtonView
            
        }
        .padding(20)
        .frame(maxWidth: .infinity)
        .foregroundColor(.theme.text.whiteText)
        .background(Color.theme.other.primary)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
    
    private var isDisable: Bool {
        return !trainingViewModel.name.isEmpty &&
        !trainingViewModel.approaches.isEmpty &&
        !trainingViewModel.repetitions.isEmpty &&
        !trainingViewModel.weight.isEmpty &&
        !trainingViewModel.description.isEmpty
    }
}

extension NewTrainingView {
    
    private var nameTextFieldView: some View {
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
    MainView()
}
