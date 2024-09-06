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
    
}
