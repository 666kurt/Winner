import SwiftUI

struct MusicScreen: View {
    @StateObject var musicViewModel = MusicViewModel()
    
    @State private var isLandscape: Bool = false
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 24) {
                Text("Music for training")
                    .font(.title.weight(.bold))
                    .foregroundColor(.white)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 15) {
                        ForEach(musicViewModel.track, id: \.id) { track in
                            NavigationLink {
                                TrackScreen()
                                    .environmentObject(musicViewModel)
                                    .onAppear {
                                        if let index = musicViewModel.track.firstIndex(where: { $0.id == track.id }) {
                                            musicViewModel.currentTrackIndex = index
                                            musicViewModel.playTrack(track)
                                        }
                                    }
                            } label: {
                                TrackRowView(track: track)
                            }
                        }
                    }
                }
                .padding(.bottom, 60)
                
            }
            .backgroundModifier()
        }
        
    }
}

#Preview {
    MusicScreen()
}
