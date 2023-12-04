//
//  PhoneCoreData+CoreDataProperties.swift
//  Pipedrive
//
//  Created by Shady Elkassas on 01/12/2023.
//
//

import Foundation
import CoreData


extension PhoneCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhoneCoreData> {
        return NSFetchRequest<PhoneCoreData>(entityName: "PhoneCoreData")
    }

    @NSManaged public var value: String?
    @NSManaged public var label: String?
    @NSManaged public var person: Person?

}

extension PhoneCoreData : Identifiable {

}
