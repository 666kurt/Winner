import SwiftUI

struct NewTrainingSheet: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        VStack(spacing: 15) {
            Text("New Workout")
                .foregroundColor(.white)
                .font(.system(size: 17, weight: .semibold))
                .padding()
            
            TextFieldView(title: "Name", 
                          text: $vm.name)
            TextFieldView(title: "Approaches",
                          text: $vm.approaches)
            TextFieldView(title: "Repetitions",
                          text: $vm.repetitions)
            TextFieldView(title: "Weight",
                          text: $vm.weight)
            TextFieldView(title: "Description",
                          text: $vm.description)
            
            Button {
                vm.addTraining()
                coordinator.dismissSheet()
            } label: {
                Text("Add a workout")
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.text.whiteText)
                    .padding(.vertical, 11)
                    .frame(maxWidth: .infinity)
                    .background(Color.theme.other.primary)
                    .clipShape(Capsule())
                    .opacity(isDisabled ? 1 : 0.5)
            }.disabled(!isDisabled)
            
        }
        .backgroundModifier()
    }
    
    private var isDisabled: Bool {
        !vm.name.isEmpty &&
        !vm.approaches.isEmpty &&
        !vm.repetitions.isEmpty &&
        !vm.weight.isEmpty &&
        !vm.description.isEmpty
    }
    
}

#Preview {
    NewTrainingSheet()
        .environmentObject(HomeViewModel())
        .environmentObject(AppCoordinator.shared)
}
