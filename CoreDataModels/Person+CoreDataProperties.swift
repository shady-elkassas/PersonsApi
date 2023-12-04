//
//  Person+CoreDataProperties.swift
//  Pipedrive
//
//  Created by Shady Elkassas on 01/12/2023.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var id: Int32
    @NSManaged public var imageURL: String?
    @NSManaged public var name: String?
    @NSManaged public var organization: String?
    @NSManaged public var email: NSSet?
    @NSManaged public var phone: NSSet?

}

// MARK: Generated accessors for email
extension Person {

    @objc(addEmailObject:)
    @NSManaged public func addToEmail(_ value: EmailCoreData)

    @objc(removeEmailObject:)
    @NSManaged public func removeFromEmail(_ value: EmailCoreData)

    @objc(addEmail:)
    @NSManaged public func addToEmail(_ values: NSSet)

    @objc(removeEmail:)
    @NSManaged public func removeFromEmail(_ values: NSSet)

}

// MARK: Generated accessors for phone
extension Person {

    @objc(addPhoneObject:)
    @NSManaged public func addToPhone(_ value: PhoneCoreData)

    @objc(removePhoneObject:)
    @NSManaged public func removeFromPhone(_ value: PhoneCoreData)

    @objc(addPhone:)
    @NSManaged public func addToPhone(_ values: NSSet)

    @objc(removePhone:)
    @NSManaged public func removeFromPhone(_ values: NSSet)

}

extension Person : Identifiable {

}
