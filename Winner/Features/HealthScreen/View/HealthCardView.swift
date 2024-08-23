import SwiftUI

struct HealthCardView: View {
    
    let isLeading: Bool
    let title: String
    let image: String
    
    var body: some View {
        
        if isLeading {
            HStack(alignment: .top) {
                Image(image)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(title)
                        .font(.title2)
                    Text("no data")
                        .font(.subheadline)
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
                    Text("no data")
                        .font(.subheadline)
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

#Preview {
    MainView()
}
