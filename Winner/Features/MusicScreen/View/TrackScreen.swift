import SwiftUI

struct TrackScreen: View {
    
    let track: Track
    
    @State private var volume: Float = 0.5
    @State private var rotateCircle1 = false
    @State private var rotateCircle2 = false
    @State private var rotateCircle3 = false
    
    var body: some View {
        VStack(spacing: 15) {
            
            circleView
            
            titleView
            
            buttonView
            
            sliderView
            
        }
        .backgroundModifier()
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Song")
                    .font(.callout)
                    .foregroundColor(.white)
            }
        }
    }
}

extension TrackScreen {
    
    private var titleView: some View {
        VStack {
            Text(track.title)
                .font(.headline.weight(.semibold))
                .foregroundColor(.white)
            Text(track.author)
                .font(.footnote)
                .foregroundColor(.theme.text.grayText)
        }
        .padding(.bottom, 20)
    }
    
    private var buttonView: some View {
        HStack(spacing: 35) {
            Button(action: {
                
            }) {
                Image(systemName: "backward.fill")
            }
            
            Button(action: {
                
            }) {
                Image(systemName: "play.fill")
            }
            
            Button(action: {
                
            }) {
                Image(systemName: "forward.fill")
            }
        }
        .font(.title2)
        .foregroundColor(.theme.text.whiteText)
        .padding(.bottom, 15)
    }
    
    private var sliderView: some View {
        HStack(spacing: 16) {
            
            Button {
                volume = 0
                
            } label: {
                Image(systemName: "speaker.slash.fill")
                    .font(.title2)
                    .foregroundColor(.theme.text.grayText)
            }
            
            Slider(value: $volume, in: 0...1)
                .accentColor(.theme.other.primary)
            
            Button {
                volume = 1
            } label: {
                Image(systemName: "speaker.wave.2.fill")
                    .font(.title2)
                    .foregroundColor(.theme.text.grayText)
            }
        }
    }
    
    private var circleView: some View {
        ZStack {
            Image("circle1")
                .resizable()
                .scaledToFit()
                .rotationEffect(.degrees(rotateCircle1 ? 360 : 0))
                .animation(rotateCircle1 ? Animation.linear(duration: 8).repeatForever(autoreverses: false) : .default, value: rotateCircle1)
            
            Image("circle2")
                .resizable()
                .scaledToFit()
                .rotationEffect(.degrees(rotateCircle2 ? -360 : 0))
                .animation(rotateCircle2 ? Animation.linear(duration: 6).repeatForever(autoreverses: false) : .default, value: rotateCircle2)
            
            Image("circle3")
                .resizable()
                .scaledToFit()
                .rotationEffect(.degrees(rotateCircle3 ? 360 : 0))
                .animation(rotateCircle3 ? Animation.linear(duration: 10).repeatForever(autoreverses: false) : .default, value: rotateCircle3)
            
            Image(systemName: "headphones")
                .resizable()
                .frame(width: 64, height: 68)
                .foregroundColor(.white)
        }
        .padding(.bottom, 70)
        .padding(.top, 30)
    }
    
    
    private func startRotating() {
        rotateCircle1 = true
        rotateCircle2 = true
        rotateCircle3 = true
    }
    
    private func stopRotating() {
        rotateCircle1 = false
        rotateCircle2 = false
        rotateCircle3 = false
    }
    
}

#Preview {
    TrackScreen(track: Track(author: "Mary Bright", title: "The Moonlight Sonata", image: "music1", file: "1.mp3"))
        .backgroundModifier()
}

