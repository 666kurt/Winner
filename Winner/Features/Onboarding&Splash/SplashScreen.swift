import SwiftUI

struct SplashScreen: View {
    
    @State private var progress: CGFloat = 0.0
    @State private var isActive: Bool = false
    @Binding var showOnboarding: Bool
    let persistenceController: PersistenceController
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                
                Image("splash")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(height: 15)
                        .foregroundColor(Color(hex: "#272727").opacity(0.44))
                    
                    Rectangle()
                        .frame(width: progress, height: 15)
                        .foregroundColor(Color(hex: "#00E0FF"))
                        .animation(.linear(duration: 0.05), value: progress)
                }
                .cornerRadius(10)
                .frame(width: geometry.size.width * 0.8)
                .padding(.bottom, 150)
            }
        }
        .onAppear {
            startLoading()
        }
        .fullScreenCover(isPresented: $isActive) {
            if showOnboarding {
                OnboardingScreen(showOnboarding: $showOnboarding)
            } else {
                MainView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
    
    func startLoading() {
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
            if progress < UIScreen.main.bounds.width * 0.8 {
                progress += 8
            } else {
                timer.invalidate()
                isActive = true
            }
        }
    }
}


#Preview {
    SplashScreen(showOnboarding: .constant(true),
                 persistenceController: PersistenceController.shared)
}
