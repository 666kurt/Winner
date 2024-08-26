import SwiftUI

struct HealthTaskRowView: View {
    
    @EnvironmentObject var healthViewModel: HealthViewModel
    let task: Task
    
    var body: some View {
        HStack(spacing: 60) {
            
            Text(task.title)
                .font(.title2)
                .foregroundColor(.theme.text.whiteText)
                .strikethrough(task.isCompleted ? true : false)
            
            Spacer()
            
            Button {
                healthViewModel.toggleCompleted(task)
            } label: {
                Image(task.isCompleted
                      ? "checkmark2"
                      : "checkmark1"
                )
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.theme.text.whiteText)
            }
            
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.theme.background.secondBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    let context = PersistenceController.preview.container.viewContext
    let sampleTask = Task(context: context)
    sampleTask.title = "Make an appointment for an examination"
    sampleTask.isCompleted = true
    
    return HealthTaskRowView(task: sampleTask)
        .padding()
        .backgroundModifier()
        .environmentObject(HealthViewModel())
}
