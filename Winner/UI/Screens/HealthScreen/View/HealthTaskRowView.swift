import SwiftUI

struct HealthTaskRowView: View {
    
    @EnvironmentObject var healthViewModel: HealthViewModel
    let task: Task
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            Text(task.title)
                .font(.title2)
                .foregroundColor(.theme.text.whiteText)
            
            Divider()
                .foregroundColor(.theme.text.grayText)
            
            Text(task.details)
                .font(.footnote)
                .foregroundColor(.theme.text.grayText)
            
            
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.theme.background.secondBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
