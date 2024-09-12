import Foundation
import CoreData

final class HomeViewModel: ObservableObject {
    
    // Props for trainings
    @Published var name: String = ""
    @Published var approaches: String = ""
    @Published var repetitions: String = ""
    @Published var weight: String = ""
    @Published var description: String = ""
    
    // Props for goals
    @Published var goalWorkout: String = "0"
    @Published var goalHeight: String = "0"
    
    @Published var trainings: [Training] = []
    
    private var currentTraining: Training?
    
    private let viewContext = PersistenceController.shared.container.viewContext
    
    init() {
        fetchTrainings()
        fetchGoalData()
    }
    
    // MARK: - Goals
    func fetchGoalData() {
        let request: NSFetchRequest<GoalData> = GoalData.fetchRequest()
        do {
            let goalData = try viewContext.fetch(request)
            if let data = goalData.first {
                goalWorkout = data.goalWorkout
                goalHeight = data.goalHeight
            }
        } catch {
            print("Error fetching health data: \(error)")
        }
    }
    
    func saveGoalData() {
        let request: NSFetchRequest<GoalData> = GoalData.fetchRequest()
        do {
            let goalData = try viewContext.fetch(request)
            let data: GoalData
            
            if let existingData = goalData.first {
                data = existingData
            } else {
                data = GoalData(context: viewContext)
            }
            
            data.goalHeight = goalHeight
            data.goalWorkout = goalWorkout
            
            saveContext()
        } catch {
            print("Error saving health data: \(error)")
        }
    }
    
    // MARK: - Trainings
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
    
    func setCurrentTraining(_ training: Training) {
        currentTraining = training
        name = training.name
        approaches = training.approaches
        repetitions = training.repetitions
        weight = training.weight
        description = training.details
    }
    
    func updateTraining() {
        guard let training = currentTraining else { return }
        training.name = name
        training.approaches = approaches
        training.repetitions = repetitions
        training.weight = weight
        training.details = description
        resetFields()
        saveContext()
    }
    
    func deleteCurrentTraining() {
        guard let training = currentTraining else { return }
        viewContext.delete(training)
        resetFields()
        saveContext()
    }
    
    func deleteAllData() {
        let request: NSFetchRequest<NSFetchRequestResult> = Training.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        
        do {
            try viewContext.execute(deleteRequest)
            try viewContext.save()
            self.goalHeight = "0"
            self.goalWorkout = "0"
            fetchTrainings()
        } catch {
            print("Error deleting trainings: \(error)")
        }
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
            fetchGoalData()
        } catch {
            print("Error saving context: \(error)")
        }
    }
}
