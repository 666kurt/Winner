import SwiftUI

struct NewTaskSheet: View {
    
    @EnvironmentObject private var vm: HealthViewModel
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        VStack(spacing: 15) {
            Text("New task")
                .foregroundColor(.white)
                .font(.system(size: 17, weight: .semibold))
                .padding()
            
            TextFieldView(title: "Title",
                          text: $vm.title)
            TextFieldView(title: "Description",
                          text: $vm.description)
            
            Button {
                vm.addTask()
                coordinator.dismissSheet()
            } label: {
                Text("Add a task")
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
        !vm.title.isEmpty &&
        !vm.description.isEmpty
    }
    
}

#Preview {
    NewTaskSheet()
        .environmentObject(HealthViewModel())
        .environmentObject(AppCoordinator.shared)
}
