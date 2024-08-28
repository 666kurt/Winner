import SwiftUI

struct TimePickerSheet: View {
    @Binding var minutes: Int
    
    private let minuteOptions = Array(0...59)
    
    var body: some View {
        
        VStack {
           Text("Select time")
                .foregroundColor(Color.theme.text.whiteText)
                .font(.headline)
                .padding(.vertical, 20)
            
            HStack {
                Picker("Minutes", selection: $minutes) {
                    ForEach(minuteOptions, id: \.self) { minute in
                        Text(String(format: "%02d", minute)).tag(minute)
                    }
                }
                .pickerStyle(WheelPickerStyle())
            }
            .preferredColorScheme(.dark)
            .padding()
        }
        .backgroundModifier()
    }
}
