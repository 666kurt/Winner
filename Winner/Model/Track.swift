import Foundation

struct Track: Identifiable {
    var id = UUID()
    let author: String
    let title: String
    let image: String
    let file: String
}
