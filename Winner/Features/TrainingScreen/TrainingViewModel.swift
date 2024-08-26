import Foundation
import CoreData

final class TrainingViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var approaches: String = ""
    @Published var repetitions: String = ""
    @Published var weight: String = ""
    @Published var description: String = ""
    
    @Published var trainings: [Training] = []
    
    private let viewContext = PersistenceController.shared.container.viewContext
    
    init() {
        fetchTrainings()
    }
    
    func fetchTrainings() {
        let request: NSFetchRequest<Training> = Training.fetchRequest()
        do {
            trainings = try viewContext.fetch(request)
        } catch {
            print("Error fetching trainings: \(error)")
        }
    }
    
    func addTraining() {
        let newTraining = Training(context: viewContext)
        newTraining.id = UUID()
        newTraining.name = name
        newTraining.approaches = approaches
        newTraining.weight = weight
        newTraining.repetitions = repetitions
        newTraining.details = description
        resetFields()
        saveContext()
    }
    
    private func resetFields() {
        self.name = ""
        self.approaches = ""
        self.repetitions = ""
        self.weight = ""
        self.description = ""
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
            fetchTrainings()
        } catch {
            print("Error saving context: \(error)")
        }
    }
}
