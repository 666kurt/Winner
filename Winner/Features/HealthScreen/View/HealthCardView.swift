import SwiftUI

struct HealthCardView: View {
    
    @EnvironmentObject var healthViewModel: HealthViewModel
    
    let isLeading: Bool
    let title: String
    let image: String
    @Binding var text: String
    
    var body: some View {
        
        if isLeading {
            HStack(alignment: .top) {
                Image(image)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(title)
                        .font(.title2)
                    
                    ZStack(alignment: .leading) {
                        if text.isEmpty {
                            Text("no data")
                                .font(.subheadline)
                        }
                        TextField("", text: $text)
                            .font(.subheadline)
                            .keyboardType(.numberPad)
                            .onChange(of: text) { _ in
                                DispatchQueue.main.async {
                                    healthViewModel.saveHealthData()
                                }
                            }
                    }
                }
                .foregroundColor(.theme.text.whiteText)
                .frame(maxWidth: 150, alignment: .leading)
                
            }
            .padding(.trailing, 20)
            .padding(.top, 20)
            .frame(maxWidth: .infinity, maxHeight: 100)
            .background(Color.theme.background.secondBackground)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        } else {
            HStack(alignment: .top) {
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(title)
                        .font(.title2)
                    ZStack(alignment: .leading) {
                        if text.isEmpty {
                            Text("no data")
                                .font(.subheadline)
                                .onChange(of: text) { _ in
                                    DispatchQueue.main.async {
                                        healthViewModel.saveHealthData()
                                    }
                                }
                            
                        }
                        TextField("", text: $text)
                            .font(.subheadline)
                            .keyboardType(.numberPad)
                    }
                }
                .foregroundColor(.theme.text.whiteText)
                .frame(maxWidth: 150, alignment: .leading)
                
                Spacer()
                
                Image(image)
                
            }
            .padding(.leading, 20)
            .padding(.top, 20)
            .frame(maxWidth: .infinity, maxHeight: 100)
            .background(Color.theme.background.secondBackground)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        
    }
}
