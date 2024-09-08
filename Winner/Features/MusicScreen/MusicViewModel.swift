import SwiftUI
import AVKit
import Combine

final class MusicViewModel: ObservableObject {
    
    @Published var track: [Track] = [
        Track(author: "Mary Bright", title: "The Moonlight Sonata", image: "music1", file: "1.mp3"),
        Track(author: "John Silver", title: "Dreamy Love", image: "music2", file: "2.mp3"),
        Track(author: "David Rose", title: "In the Sky", image: "music3", file: "3.mp3"),
        Track(author: "Sarah Green", title: "My Heart is Yours", image: "music4", file: "4.mp3"),
        Track(author: "James Brown", title: "Blue Ocean", image: "music5", file: "5.mp3"),
        Track(author: "Emily White", title: "Sunshine and Rain", image: "music6", file: "6.mp3"),
        Track(author: "Peter Black", title: "Forever in My Dreams", image: "music7", file: "7.mp3"),
    ]
    @Published var currentTrackIndex: Int = 0
    @Published var isPlaying: Bool = false
    
    private var player: AVPlayer?
    
    var currentTrack: Track {
        return track[currentTrackIndex]
    }
    
    func playTrack(_ track: Track) {
        guard let url = Bundle.main.url(forResource: track.file, withExtension: nil) else {
            print("Файл не найден: \(track.file)")
            return
        }
        
        player = AVPlayer(url: url)
        player?.play()
        isPlaying = true
    }
    
    func stopPlaying() {
        player?.pause()
        isPlaying = false
    }
    
    func togglePlayPause() {
        if isPlaying {
            player?.pause()
        } else {
            player?.play()
        }
        isPlaying.toggle()
    }
    
    func playNextTrack() {
        if currentTrackIndex < track.count - 1 {
            currentTrackIndex += 1
            playTrack(track[currentTrackIndex])
        }
    }
    
    func playPreviousTrack() {
        if currentTrackIndex > 0 {
            currentTrackIndex -= 1
            playTrack(track[currentTrackIndex])
        }
    }
    
    func adjustVolume(_ volume: Float) {
        player?.volume = volume
    }
}
