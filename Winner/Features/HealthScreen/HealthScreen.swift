import SwiftUI

struct HealthScreen: View {
    
    @EnvironmentObject var healthViewModel: HealthViewModel
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                
                NavigationTitleView(title: "My health",
                                    subtitle: "9/10 of our happiness depends on health")
                
                healthDataView
                
                if healthViewModel.tasks.isEmpty {
                    taskListEmptyView
                } else {
                    taskListView
                }
            }
            .onAppear() {
                healthViewModel.fetchTasks()
                healthViewModel.fetchHealthData()
            }
            
            if coordinator.showNewTask {
                NewTaskView()
            }
        }
        .backgroundModifier()
    }
    
}

extension HealthScreen {
    
    private var healthDataView: some View {
        VStack(spacing: 8) {
            HealthCardView(isLeading: false,
                           title: "Height",
                           image: "height", 
                           text: $healthViewModel.height)
            HealthCardView(isLeading: true,
                           title: "Weight",
                           image: "weight",
                           text: $healthViewModel.weight)
            HealthCardView(isLeading: false,
                           title: "Pulse",
                           image: "pulse",
                           text: $healthViewModel.pulse)
            HealthCardView(isLeading: true,
                           title: "Body girths",
                           image: "body",
                           text: $healthViewModel.body)
        }
    }
    
    private var taskListEmptyView: some View {
        VStack(spacing: 12) {
            Button {
                coordinator.toggleNewTask()
            } label: {
                Text("Add a task")
                    .padding(.vertical, 13.5)
                    .frame(maxWidth: .infinity)
                    .background(Color.theme.other.primary)
                    .clipShape(Capsule())
                    .foregroundColor(.theme.text.whiteText)
                    .font(.footnote.weight(.semibold))
            }
            
        }
        .padding(.top, 24)
    }
    
    private var taskListView: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 11) {
                ForEach(healthViewModel.tasks, id: \.self) { task in
                    HealthTaskRowView(task: task)
                }
            }
        }
        .padding(.top, 24)
    }
}

#Preview {
    MainView()
}
