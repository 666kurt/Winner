import Foundation
import CoreData


extension Training {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Training> {
        return NSFetchRequest<Training>(entityName: "Training")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String
    @NSManaged public var approaches: String
    @NSManaged public var repetitions: String
    @NSManaged public var weight: String
    @NSManaged public var details: String

}

extension Training : Identifiable {

}
