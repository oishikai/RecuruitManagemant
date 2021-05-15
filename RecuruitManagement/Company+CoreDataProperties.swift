//
//  Company+CoreDataProperties.swift
//  RecuruitManagement
//
//  Created by Kai on 2021/05/15.
//
//

import Foundation
import CoreData


extension Company {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Company> {
        return NSFetchRequest<Company>(entityName: "Company")
    }

    @NSManaged public var aspiration: String?
    @NSManaged public var companyName: String?
    @NSManaged public var url: URL?
    @NSManaged public var event: NSSet?

}

// MARK: Generated accessors for event
extension Company {

    @objc(addEventObject:)
    @NSManaged public func addToEvent(_ value: Event)

    @objc(removeEventObject:)
    @NSManaged public func removeFromEvent(_ value: Event)

    @objc(addEvent:)
    @NSManaged public func addToEvent(_ values: NSSet)

    @objc(removeEvent:)
    @NSManaged public func removeFromEvent(_ values: NSSet)

}

extension Company : Identifiable {

}
