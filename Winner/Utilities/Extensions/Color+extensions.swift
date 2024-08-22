import SwiftUI

extension Color {
    
    init(hex: String) {
            var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
            cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
            print(cleanHexCode)
            var rgb: UInt64 = 0
            
            Scanner(string: cleanHexCode).scanHexInt64(&rgb)
            
            let redValue = Double((rgb >> 16) & 0xFF) / 255.0
            let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
            let blueValue = Double(rgb & 0xFF) / 255.0
            self.init(red: redValue, green: greenValue, blue: blueValue)
        }
    
    static let theme = ColorTheme()
}

struct ColorTheme {
    
    struct BackgroundColor {
        let mainBackground = Color("mainBackground")
        let secondBackground = Color("secondBackground")
    }
    
    struct TextColor {
        let mainText = Color("mainText")
        let grayText = Color.white.opacity(0.3)
        let whiteText = Color.white
        let tabText = Color("tabText")
    }
    
    struct OtherColor {
        let primary = Color("mainColor")
        let secondary = Color("secondColor")
        let primaryWhite = Color.white
    }
    
    let background = BackgroundColor()
    let text = TextColor()
    let other = OtherColor()
}
