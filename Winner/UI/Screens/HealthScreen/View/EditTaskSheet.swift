import SwiftUI

struct EditTaskSheet: View {
    @EnvironmentObject private var vm: HealthViewModel
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: 24, height: 1)
                
                Spacer()
                
                Text("New task")
                    .foregroundColor(.white)
                    .font(.system(size: 17, weight: .semibold))
                    .padding()
                
                Spacer()
                
                Button {
                    coordinator.toggleDeleteTrainingAlert()
                } label: {
                    Image(systemName: "trash")
                        .resizable()
                        .frame(width: 24, height: 22)
                }
            }
            
            TextFieldView(title: "Title",
                          text: $vm.title)
            TextFieldView(title: "Description",
                          text: $vm.description)

            
            Button {
//                vm.updateTraining()
                coordinator.dismissSheet()
            } label: {
                Text("Save")
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.text.whiteText)
                    .padding(.vertical, 11)
                    .frame(maxWidth: .infinity)
                    .background(Color.theme.other.primary)
                    .clipShape(Capsule())
            }
            
        }
        .backgroundModifier()
        .alert(isPresented: $coordinator.deleteTrainingAlert) {
            Alert(
                title: Text("Delete"),
                message: Text("Do you really want to delete this?"),
                primaryButton: .destructive(Text("Delete")) {
//                    vm.deleteCurrentTraining()
                    coordinator.dismissSheet()
                },
                secondaryButton: .cancel()
            )
        }
        .colorScheme(.dark)
    }
}

#Preview {
    EditTaskSheet()
        .environmentObject(HealthViewModel())
        .environmentObject(AppCoordinator.shared)
}
