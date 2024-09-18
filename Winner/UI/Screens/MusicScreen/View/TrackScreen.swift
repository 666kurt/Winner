import SwiftUI

struct TrackScreen: View {
    @EnvironmentObject var musicViewModel: MusicViewModel

    @State private var volume: Float = 0.5
    @State private var rotateCircle1 = false
    @State private var rotateCircle2 = false
    @State private var rotateCircle3 = false

    var body: some View {
        VStack(spacing: 15) {
            Spacer()
            
            circleView
            
            titleView
            
            buttonView
            sliderView
            
            Spacer()
            Spacer()
        }
        .backgroundModifier()
        .onAppear {
            musicViewModel.playTrack(musicViewModel.currentTrack)
            startRotating()
        }
        .onDisappear {
            musicViewModel.stopPlaying()
            stopRotating()
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Song")
                    .font(.callout)
                    .foregroundColor(.white)
            }
        }
    }
    
    private var titleView: some View {
        VStack {
            Text(musicViewModel.currentTrack.title)
                .font(.headline.weight(.semibold))
                .foregroundColor(.white)
            Text(musicViewModel.currentTrack.author)
                .font(.footnote)
                .foregroundColor(.theme.text.grayText)
        }
        .padding(.bottom, 20)
    }
    
    private var buttonView: some View {
        HStack(spacing: 35) {
            Button(action: {
                musicViewModel.playPreviousTrack()
            }) {
                Image(systemName: "backward.fill")
            }

            Button(action: {
                musicViewModel.togglePlayPause()
                musicViewModel.isPlaying ? startRotating() : stopRotating()
            }) {
                Image(systemName: musicViewModel.isPlaying ? "pause.fill" : "play.fill")
            }

            Button(action: {
                musicViewModel.playNextTrack()
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
                musicViewModel.adjustVolume(volume)
            } label: {
                Image(systemName: "speaker.slash.fill")
                    .font(.title2)
                    .foregroundColor(.theme.text.grayText)
            }

            Slider(value: $volume, in: 0...1, onEditingChanged: { _ in
                musicViewModel.adjustVolume(volume)
            })
            .accentColor(.theme.other.primary)

            Button {
                volume = 1
                musicViewModel.adjustVolume(volume)
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
                .frame(width: UIScreen.main.bounds.width * 0.7,
                       height: UIScreen.main.bounds.width * 0.7)
                .rotationEffect(.degrees(rotateCircle1 ? 360 : 0))
                .animation(rotateCircle1 ? Animation.linear(duration: 8).repeatForever(autoreverses: true) : .default, value: rotateCircle1)

            Image("circle2")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width * 0.7,
                       height: UIScreen.main.bounds.width * 0.7)
                .rotationEffect(.degrees(rotateCircle2 ? -360 : 0))
                .animation(rotateCircle2 ? Animation.linear(duration: 6).repeatForever(autoreverses: true) : .default, value: rotateCircle2)

            Image("circle3")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width * 0.7,
                       height: UIScreen.main.bounds.width * 0.7)
                .rotationEffect(.degrees(rotateCircle3 ? 360 : 0))
                .animation(rotateCircle3 ? Animation.linear(duration: 10).repeatForever(autoreverses: true) : .default, value: rotateCircle3)

            Image(systemName: "headphones")
                .resizable()
                .frame(width: 64, height: 68)
                .foregroundColor(.white)
                .offset(y: -20)
        }
        .padding(.bottom, 30)
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
    TrackScreen()
        .environmentObject(MusicViewModel())
        .backgroundModifier()
}

