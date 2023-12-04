//
//  DataController.swift
//  Pipedrive
//
//  Created by Shady Elkassas on 28/11/2023.
//

import Foundation
import CoreData

class DataController: ObservableObject, DataControllerProtocol{
    
    let container = NSPersistentContainer(name: "CoreModel")

    
    required init(){
        
        container.loadPersistentStores{ desc, error in
            
            if let error = error{
                print("Error is: \(error.localizedDescription)")
            }
            
        }
        
    }
    
    
    func save(context: NSManagedObjectContext){
        
        do{
            try context.save()
            print("Data saved successfully!!!")
        }catch{
            print("Failed to save data :(")
        }
        
    }
   
    
}
