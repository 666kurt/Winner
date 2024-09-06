import SwiftUI

struct NewTaskView: View {
    
    @EnvironmentObject var healthViewModel: HealthViewModel
    @EnvironmentObject var coordinator: AppCoordinator
    
    @State private var isVisible: Bool = false
    
    var body: some View {
        VStack(spacing: 4) {
            
            Text("A new task")
                .font(.title.weight(.bold))
                .foregroundColor(.theme.text.whiteText)
            
            TextField("", text: $healthViewModel.title)
                .font(.title2)
                .padding(.horizontal, 17)
                .padding(.vertical, 7)
                .background(Color(hex: "#3898F3"))
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .foregroundColor(.theme.text.whiteText)
            
            Button {
                healthViewModel.addTask()
                coordinator.toggleNewTask()
            } label: {
                Text("Add")
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.theme.text.mainText)
                    .background(
                        disableButton
                        ? Color.theme.other.primaryWhite.opacity(0.7)
                        : Color.theme.other.primaryWhite
                    )
                    .clipShape(Capsule())
                    .padding(.top, 24)
            }
            .disabled(disableButton)
        }
        .padding(.horizontal, 20)
        .padding(.top, 8)
        .padding(.bottom, 18)
        .background(Color.theme.other.primary)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal, 15)
        .offset(y: isVisible ? 0 : UIScreen.main.bounds.height)
        .animation(.spring(), value: isVisible)
        .onAppear {
            withAnimation {
                self.isVisible = true
            }
        }
        .onDisappear {
            withAnimation {
                self.isVisible = false
            }
        }
        .offset(y: -(UIScreen.main.bounds.height * 0.2))
    }
    
    private var disableButton: Bool {
        healthViewModel.title.isEmpty
    }
}

