//
//  CacheDataProtocol.swift
//  Pipedrive
//
//  Created by Shady Elkassas on 01/12/2023.
//

import Foundation
import CoreData

protocol CacheDataProtocol {
    
    var dataController: DataController { get } // DataController property
    
    func cachePersons(data: [Datum], managedObjectContext: NSManagedObjectContext)
    
}
