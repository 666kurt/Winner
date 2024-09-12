import SwiftUI

struct HealthScreen: View {
    
    @EnvironmentObject var healthViewModel: HealthViewModel
    @EnvironmentObject var homeViewModel: HomeViewModel
    @EnvironmentObject var coordinator: AppCoordinator
    @State private var isLandscape: Bool = false
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 0) {
                
                NavigationTitleView(title: "My health",
                                    subtitle: "9/10 of our happiness depends on health",
                                    haveButton: true,
                                    action: {
                    healthViewModel.resetDataFields()
                })
                
                healthDataView
                
                taskTitleView
                
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

extension HealthScreen {
    
    private var healthDataView: some View {
        VStack(spacing: 8) {
            HStack {
                HealthCardView(title: "Height",
                               value: healthViewModel.height.isEmpty
                               ? "no data" : healthViewModel.height,
                               image: "height", action: {
                    coordinator.presentInputForm(inputForm: .height)
                })
                HealthCardView(title: "Weight",
                               value: healthViewModel.weight.isEmpty
                               ? "no data" : healthViewModel.weight,
                               image: "weight", action: {
                    coordinator.presentInputForm(inputForm: .weight)
                })
            }
            HStack {
                HealthCardView(title: "Pulse",
                               value: healthViewModel.pulse.isEmpty
                               ? "no data" : healthViewModel.pulse,
                               image: "pulse", action: {
                    coordinator.presentInputForm(inputForm: .pulse)
                })
                HealthCardView(title: "Body girths",
                               value: healthViewModel.body.isEmpty
                               ? "no data" : healthViewModel.body,
                               image: "body", action: {
                    coordinator.presentInputForm(inputForm: .body)
                })
            }
        }
    }
    
    private var taskTitleView: some View {
        Text("Tasks")
            .font(.largeTitle.weight(.bold))
            .foregroundColor(.theme.text.whiteText)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 20)
    }
    
    private var taskListEmptyView: some View {
        VStack(spacing: 8) {
            Text("Add a task")
                .font(.title.weight(.bold))
                .foregroundColor(Color.theme.text.whiteText)
            Text("Write down your daily tasks")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .foregroundColor(Color.theme.text.grayText)
                .padding(.bottom, 8)
            
            Button {
                coordinator.present(sheet: .newTask)
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
    }
    
    private var taskListView: some View {
        ZStack(alignment: .bottom) {
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 14) {
                    ForEach(healthViewModel.tasks, id: \.self) { task in
                        HealthTaskRowView(task: task)
                    }
                }
            }
            .padding(.bottom, 150)
            
            Text("Add a task")
                .fontWeight(.bold)
                .foregroundColor(Color.theme.text.whiteText)
                .padding(.vertical, 11)
                .frame(maxWidth: .infinity)
                .background(Color.theme.other.primary)
                .clipShape(Capsule())
                .offset(y: -100)
                .onTapGesture {
                    coordinator.present(sheet: .newTask)
                }
        }
    }
}

#Preview {
    HealthScreen()
        .environmentObject(HealthViewModel())
        .environmentObject(HomeViewModel())
        .environmentObject(AppCoordinator.shared)
}
