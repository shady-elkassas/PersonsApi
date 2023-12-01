//
//  DataControllerProtocol.swift
//  Pipedrive
//
//  Created by Shady Elkassas on 01/12/2023.
//

import Foundation
import CoreData

protocol DataControllerProtocol {
    
    var container: NSPersistentContainer { get }
    
    init()
    func save(context: NSManagedObjectContext)
    
}
