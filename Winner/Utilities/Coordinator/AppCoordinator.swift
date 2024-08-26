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

final class AppCoordinator: ObservableObject {
    
    static let shared = AppCoordinator()
    private init() {}
    
    @Published var path = Path()
    @Published var selectedScreen: Screens = .home
    @Published var showNewTraining: Bool = false
    @Published var showNewTask: Bool = false
    
    func switchScreen(_ screen: Screens) {
        selectedScreen = screen
    }
    
    func toggleNewTraining() {
        selectedScreen = .training
        showNewTraining.toggle()
    }
    
    func toggleNewTask() {
        showNewTask.toggle()
    }
    
}
