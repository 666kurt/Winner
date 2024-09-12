import SwiftUI

enum Screens: String, Identifiable {
    case home
    case radio
    case health
    case training
    
    var id: String {
        self.rawValue
    }
}

enum InputForm: String, Identifiable {
    case goalWeight
    case goalWorkout
    case weight
    case height
    case pulse
    case body
    
    var id: String {
        self.rawValue
    }
}

enum Sheet: String, Identifiable {
    case newTraining
    case editTrainig
    case newTask
    case editTask
    
    var id: String {
        self.rawValue
    }
}

final class AppCoordinator: ObservableObject {
    
    static let shared = AppCoordinator()
    private init() {}
    
    @Published var path = Path()
    @Published var selectedScreen: Screens = .home
    @Published var sheet: Sheet?
    @Published var deleteTrainingAlert = false
    @Published var deleteTaskAlert = false
    @Published var deleteDataAlert = false
    @Published var inputForm: InputForm?
    
    func present(sheet: Sheet) {
        self.sheet = sheet
    }
    
    func presentInputForm(inputForm: InputForm) {
        self.inputForm = inputForm
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissInputForm() {
        self.inputForm = nil
    }
    
    func toggleDeleteTrainingAlert() {
        self.deleteTrainingAlert.toggle()
    }
    
    func toggleDeleteTaskAlert() {
        self.deleteTrainingAlert.toggle()
    }
    
    func toggleDataAlert() {
        self.deleteDataAlert.toggle()
    }
    
    @ViewBuilder
    func build(sheet: Sheet) -> some View {
        switch sheet {
        case .newTraining:
            NewTrainingSheet()
        case .editTrainig:
            EditTrainingSheet()
        case .newTask:
            NewTaskSheet()
        case .editTask:
            EditTaskSheet()
        }
    }
    
    @ViewBuilder
    func buildInputForm(form: InputForm, homeVM: HomeViewModel, healthVM: HealthViewModel) -> some View {
        switch form {
        case .goalWeight:
            StaticticsInputView(text: Binding(
                                    get: { homeVM.goalHeight },
                                    set: { homeVM.goalHeight = $0 }
                                ),
                                title: "Weight",
                                subtitle: "To track progress",
                                saveButton: { [self] in
                homeVM.saveGoalData()
                                    self.dismissInputForm()
                                })
            
        case .goalWorkout:
            StaticticsInputView(text: Binding(
                                    get: { homeVM.goalWorkout },
                                    set: { homeVM.goalWorkout = $0 }
                                ),
                                title: "Number of workouts per week",
                                subtitle: "To track progress",
                                saveButton: {
                homeVM.saveGoalData()
                                    self.dismissInputForm()
                                })
        case .weight:
            StaticticsInputView(text: Binding(
                                    get: { healthVM.weight },
                                    set: { healthVM.weight = $0 }
                                ),
                                title: "Weight",
                                subtitle: "To track your health status",
                                saveButton: {
                healthVM.saveHealthData()
                                    self.dismissInputForm()
                                })
        case .height:
            StaticticsInputView(text: Binding(
                                    get: { healthVM.height },
                                    set: { healthVM.height = $0 }
                                ),
                                title: "Height",
                                subtitle: "To track your health status",
                                saveButton: {
                healthVM.saveHealthData()
                                    self.dismissInputForm()
                                })
        case .pulse:
            StaticticsInputView(text: Binding(
                                    get: { healthVM.pulse },
                                    set: { healthVM.pulse = $0 }
                                ),
                                title: "Pusle",
                                subtitle: "To track your health status",
                                saveButton: {
                healthVM.saveHealthData()
                                    self.dismissInputForm()
                                })
        case .body:
            StaticticsInputView(text: Binding(
                                    get: { healthVM.body },
                                    set: { healthVM.body = $0 }
                                ),
                                title: "Body girths",
                                subtitle: "To track your health status",
                                saveButton: {
                healthVM.saveHealthData()
                                    self.dismissInputForm()
                                })
        }
    }
    
}
