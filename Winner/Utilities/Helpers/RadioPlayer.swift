import AVFoundation

final class RadioPlayer {
    static let shared = RadioPlayer()

    private var player: AVPlayer?
    
    private init() { }

    func prepareToPlay(url: String) {
        guard let streamURL = URL(string: url) else { return }
        player = AVPlayer(url: streamURL)
        player?.volume = 0.5
    }

    func play() {
        player?.play()
    }

    func pause() {
        player?.pause()
    }

    func stop() {
        player?.pause()
        player?.seek(to: .zero)
    }

    func setVolume(_ volume: Float) {
        player?.volume = volume
    }
}
