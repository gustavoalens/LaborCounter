import Foundation
import CoreData

extension Contraction {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<ContractionBase> {
    return NSFetchRequest<ContractionBase>(entityName: "ContractionBase")
  }
  
  @NSManaged public var id: Int
  @NSManaged public var end: Date?
  @NSManaged public var start: Date?
  @NSManaged public var count: Double
  @NSManaged public var diffFromLast: Double
  
}
