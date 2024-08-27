import SwiftUI
import AVKit
import Combine

final class RadioViewModel: ObservableObject {
    @Published var stations: [Datum] = []
    @Published var localStations: [LocalRadioStation] = []
    @Published var currentStationIndex: Int = 0
    @Published var isPlaying: Bool = false

    private var cancellables = Set<AnyCancellable>()
    
    private var currentPage = 1
    private var hasNextPage = true

    init() {
        loadStations()
        if !localStations.isEmpty {
            prepareToPlay(station: localStations[currentStationIndex])
        }
    }

    func fetchStations() {
        guard hasNextPage else { return }

        let headers = [
            "x-rapidapi-key": "d630b9dcc1msh566fc54456af77bp190a82jsn9ecc52c25583",
            "x-rapidapi-host": "50k-radio-stations.p.rapidapi.com"
        ]

        var request = URLRequest(url: URL(string: "https://50k-radio-stations.p.rapidapi.com/get/channels?page=\(currentPage)")!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: RadioStation.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching data: \(error)")
                }
            }, receiveValue: { [weak self] response in
                guard let self = self else { return }
                self.hasNextPage = response.hasNext
                self.stations += response.data.filter { !$0.httpsURL.isEmpty }
                self.saveStationsLocally()
                if self.hasNextPage {
                    self.currentPage += 1
                }
            })
            .store(in: &cancellables)
    }

    func saveStationsLocally() {
        let localStations = stations.compactMap { station -> LocalRadioStation? in
            guard let streamURL = station.httpsURL.first?.url else { return nil }
            return LocalRadioStation(name: station.name, streamURL: streamURL, trackName: "Unknown Track", artistName: "Unknown Artist")
        }
        
        self.localStations = localStations
        
        if let encodedData = try? JSONEncoder().encode(localStations) {
            UserDefaults.standard.set(encodedData, forKey: "savedStations")
        }
    }

    func loadStations() {
        if let savedStationsData = UserDefaults.standard.data(forKey: "savedStations") {
            if let savedStations = try? JSONDecoder().decode([LocalRadioStation].self, from: savedStationsData) {
                self.localStations = savedStations
            }
        }
    }
    
    func prepareToPlay(station: LocalRadioStation) {
        RadioPlayer.shared.prepareToPlay(url: station.streamURL)
    }
    
    func play() {
        RadioPlayer.shared.play()
        isPlaying = true
    }
    
    func pause() {
        RadioPlayer.shared.pause()
        isPlaying = false
    }
    
    func stop() {
        RadioPlayer.shared.stop()
        isPlaying = false
    }
    
    func nextStation() {
        currentStationIndex = (currentStationIndex + 1) % localStations.count
        prepareToPlay(station: localStations[currentStationIndex])
        play()
        if currentStationIndex == localStations.count - 1 && hasNextPage {
            fetchStations()
        }
    }
    
    func previousStation() {
        currentStationIndex = (currentStationIndex - 1 + localStations.count) % localStations.count
        prepareToPlay(station: localStations[currentStationIndex])
        play()
    }
    
    func setVolume(_ volume: Float) {
        RadioPlayer.shared.setVolume(volume)
    }
}
