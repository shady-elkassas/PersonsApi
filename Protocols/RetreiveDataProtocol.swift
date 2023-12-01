//
//  Protocols.swift
//  Pipedrive
//
//  Created by Shady Elkassas on 01/12/2023.
//

import Foundation
import CoreData

protocol RetreiveDataProtocol {
    
    var personsData: [Datum] { get }
    var managedObjectContext: NSManagedObjectContext? { get }
    var PersonRoot: PersonModel? { get }
    var nextStart: Int { get }
    
    func setManagedObjectContext(managedObjectContext: NSManagedObjectContext)
    func getData() async
    
}








