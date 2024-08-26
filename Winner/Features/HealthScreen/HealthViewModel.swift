import Foundation
import CoreData

final class HealthViewModel: ObservableObject {
    
    @Published var title: String = ""
    @Published var tasks: [Task] = []
    
    @Published var height: String = ""
    @Published var weight: String = ""
    @Published var pulse: String = ""
    @Published var body: String = ""
    
    private let viewContext = PersistenceController.shared.container.viewContext
    
    init() {
        fetchTasks()
        fetchHealthData()
    }
    
    func fetchHealthData() {
        let request: NSFetchRequest<HealthData> = HealthData.fetchRequest()
        do {
            let healthData = try viewContext.fetch(request)
            if let data = healthData.first {
                height = data.height
                weight = data.weight
                pulse = data.pulse
                body = data.body
            }
        } catch {
            print("Error fetching health data: \(error)")
        }
    }
    
    func saveHealthData() {
        let request: NSFetchRequest<HealthData> = HealthData.fetchRequest()
        do {
            let healthData = try viewContext.fetch(request)
            let data: HealthData
            
            if let existingData = healthData.first {
                data = existingData
            } else {
                data = HealthData(context: viewContext)
            }
            
            data.height = height
            data.weight = weight
            data.pulse = pulse
            data.body = body
            
            saveContext()
        } catch {
            print("Error saving health data: \(error)")
        }
    }
    
    func fetchTasks() {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        do {
            tasks = try viewContext.fetch(request)
        } catch {
            print("Error fetching trainings: \(error)")
        }
    }
    
    func addTask() {
        let newTask = Task(context: viewContext)
        newTask.title = title
        newTask.isCompleted = false
        resetFields()
        saveContext()
    }
    
    func toggleCompleted(_ task: Task) {
        task.isCompleted.toggle()
        saveContext()
    }
    
    private func resetFields() {
        self.title = ""
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
            fetchTasks()
            fetchHealthData()
        } catch {
            print("Error saving context: \(error)")
        }
    }
    
}
