import SwiftUI

struct TrackRowView: View {
    
    let track: Track
    
    var body: some View {
        HStack(spacing: 15) {
            
            Image(track.image)
            
            VStack(alignment: .leading) {
                Text(track.title)
                    .font(.headline.weight(.semibold))
                    .foregroundColor(.white)
                Text(track.author)
                    .foregroundColor(.theme.text.grayText)
            }
            
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 15)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.theme.background.secondBackground)
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}

#Preview {
    TrackRowView(track: Track(author: "Mary Bright", title: "The Moonlight Sonata", image: "music1", file: "1.mp3"))
        .padding()
        .background(Color.theme.background.mainBackground)
}
