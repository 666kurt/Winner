import SwiftUI

struct HealthScreen: View {
    
    @EnvironmentObject var healthViewModel: HealthViewModel
    @EnvironmentObject var coordinator: AppCoordinator
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

extension HealthScreen {
    
    private var content: some View {
        ZStack {
            VStack(spacing: 0) {
                
                NavigationTitleView(title: "My health",
                                    subtitle: "9/10 of our happiness depends on health",
                                    haveButton: haveButton,
                                    action: {
                    coordinator.toggleNewTask()
                })
                
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
    }
    
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
    
    private var haveButton: Bool {
        !healthViewModel.tasks.isEmpty
    }
}

#Preview {
    MainView()
}
