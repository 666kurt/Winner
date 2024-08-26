import Foundation
import CoreData


extension HealthData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HealthData> {
        return NSFetchRequest<HealthData>(entityName: "HealthData")
    }

    @NSManaged public var height: String
    @NSManaged public var weight: String
    @NSManaged public var pulse: String
    @NSManaged public var body: String

}

extension HealthData : Identifiable {

}
