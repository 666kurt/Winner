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
    
    func switchScreen(_ screen: Screens) {
        selectedScreen = screen
    }
    
}
