import Foundation
import CoreData


extension GoalData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GoalData> {
        return NSFetchRequest<GoalData>(entityName: "GoalData")
    }

    @NSManaged public var goalHeight: String
    @NSManaged public var goalWorkout: String

}

extension GoalData : Identifiable {

}
