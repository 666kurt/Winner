import SwiftUI

struct NewTrainingView: View {
    
    @Binding var name: String
    @Binding var approaches: String
    @Binding var repetitions: String
    @Binding var weight: String
    @Binding var description: String
    
    var body: some View {
        VStack(spacing: 12) {
            
            ZStack(alignment: .leading) {
                if name.isEmpty {
                    Text("Name")
                }
                TextField("", text: $name)
                
            }
            .font(.title2)
            .padding(4)
            .background(Color.theme.background.secondBackground)
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            HStack() {
                VStack(spacing: 5) {
                    TextField("", text: $approaches)
                        .font(.title.weight(.bold))
                        .keyboardType(.numberPad)
                    Text("Approaches")
                        .font(.subheadline)
                }
                .padding(4)
                .background(Color.theme.background.secondBackground)
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
                VStack(spacing: 5) {
                    TextField("", text: $repetitions)
                        .font(.title.weight(.bold))
                        .keyboardType(.numberPad)
                    Text("Repetitions")
                        .font(.subheadline)
                }
                .padding(4)
                .background(Color.theme.background.secondBackground)
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
                VStack(spacing: 5) {
                    TextField("", text: $weight)
                        .font(.title.weight(.bold))
                        .keyboardType(.numberPad)
                    Text("Weight")
                        .font(.subheadline)
                }
                .padding(4)
                .background(Color.theme.background.secondBackground)
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            VStack(alignment: .leading) {
                Text("Description")
                TextField("", text: $description)
            }
            .padding(4)
            .background(Color.theme.background.secondBackground)
            .frame(maxWidth: .infinity, alignment: .leading)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Button {
                // добавление тренировки
            } label: {
                Text("Add")
                    .padding(11)
                    .font(.system(size: 14, weight: .semibold))
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.theme.text.mainText)
                    .background(isDisable ? Color.theme.other.primaryWhite :
                                    Color.theme.other.secondary
                    )
                    .clipShape(Capsule())
            }.disabled(!isDisable)
            
        }
        .padding(20)
        .frame(maxWidth: .infinity)
        .foregroundColor(.theme.text.whiteText)
        .background(Color.theme.other.primary)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
    
    private var isDisable: Bool {
        return !name.isEmpty && !approaches.isEmpty &&
        !repetitions.isEmpty && !weight.isEmpty && 
        !description.isEmpty
    }
}

#Preview {
    NewTrainingView(name: .constant("g"),
                    approaches: .constant("g"),
                    repetitions: .constant("g"),
                    weight: .constant("fg"),
                    description: .constant("f"))
        .padding()
}
