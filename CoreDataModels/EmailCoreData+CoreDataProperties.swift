//
//  EmailCoreData+CoreDataProperties.swift
//  Pipedrive
//
//  Created by Shady Elkassas on 01/12/2023.
//
//

import Foundation
import CoreData


extension EmailCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EmailCoreData> {
        return NSFetchRequest<EmailCoreData>(entityName: "EmailCoreData")
    }

    @NSManaged public var label: String?
    @NSManaged public var value: String?
    @NSManaged public var person: Person?

}

extension EmailCoreData : Identifiable {

}
