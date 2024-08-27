import SwiftUI

struct RadioScreen: View {
    @StateObject var radioViewModel = RadioViewModel()
    @State private var volume: Float = 0.5
    
    @State private var rotateCircle1 = false
    @State private var rotateCircle2 = false
    @State private var rotateCircle3 = false
    
    @State private var isLandscape: Bool = false
    
    var body: some View {
        
        GeometryReader { geo in
            VStack(spacing: 32) {
                
                circleView
                    .frame(height: geo.size.height * 0.5)
                
                buttonView
                
                sliderView
                
            }
            .backgroundModifier()
            .onAppear {
                radioViewModel.fetchStations()
                startRotationIfPlaying()
            }
        }
    }
    
    private func startRotationIfPlaying() {
        if radioViewModel.isPlaying {
            startRotating()
        }
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

extension RadioScreen {
    
    private var buttonView: some View {
        HStack(spacing: 35) {
            Button(action: {
                radioViewModel.previousStation()
            }) {
                Image(systemName: "backward.fill")
            }
            
            Button(action: {
                if radioViewModel.isPlaying {
                    radioViewModel.pause()
                    stopRotating()
                } else {
                    radioViewModel.play()
                    startRotating()
                }
            }) {
                Image(systemName: radioViewModel.isPlaying ? "pause.fill" : "play.fill")
            }
            
            Button(action: {
                radioViewModel.nextStation()
            }) {
                Image(systemName: "forward.fill")
            }
        }
        .font(.title2)
        .foregroundColor(.theme.text.whiteText)
    }
    
    private var sliderView: some View {
        HStack(spacing: 16) {
            
            Button {
                volume = 0
                radioViewModel.setVolume(volume)
            } label: {
                Image(systemName: "speaker.slash.fill")
                    .font(.title2)
                    .foregroundColor(.theme.text.grayText)
            }
            
            Slider(value: Binding(get: {
                volume
            }, set: { newValue in
                volume = newValue
                radioViewModel.setVolume(volume)
            }), in: 0...1)
            .accentColor(.theme.other.primary)
            
            Button {
                volume = 1
                radioViewModel.setVolume(volume)
            } label: {
                Image(systemName: "speaker.wave.2.fill")
                    .font(.title2)
                    .foregroundColor(.theme.text.grayText)
            }
        }
    }
    
    private var circleView: some View {
        GeometryReader { geo in
            ZStack {
                
                Image("circle1")
                    .resizable()
                    .frame(width: geo.size.width - 100,
                           height:  geo.size.width - 100)
                    .rotationEffect(.degrees(rotateCircle1 ? 360 : 0))
                    .animation(rotateCircle1 ? Animation.linear(duration: 8).repeatForever(autoreverses: false) : .default, value: rotateCircle1)
                
                Image("circle2")
                    .resizable()
                    .frame(width: geo.size.width - 100,
                           height:  geo.size.width - 100)
                    .rotationEffect(.degrees(rotateCircle2 ? -360 : 0))
                    .animation(rotateCircle2 ? Animation.linear(duration: 6).repeatForever(autoreverses: false) : .default, value: rotateCircle2)
                
                Image("circle3")
                    .resizable()
                    .frame(width: geo.size.width - 100,
                           height:  geo.size.width - 100)
                    .rotationEffect(.degrees(rotateCircle3 ? 360 : 0))
                    .animation(rotateCircle3 ? Animation.linear(duration: 10).repeatForever(autoreverses: false) : .default, value: rotateCircle3)
                
                Text(radioViewModel.localStations[radioViewModel.currentStationIndex].name)
                    .font(.headline.weight(.semibold))
                    .foregroundColor(.theme.text.whiteText)
                    .frame(width: geo.size.width - 150)
                    .multilineTextAlignment(.center)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
}

#Preview {
    RadioScreen()
}
