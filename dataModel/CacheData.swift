//
//  CacheData.swift
//  Pipedrive
//
//  Created by Shady Elkassas on 29/11/2023.
//

import Foundation
import CoreData
import UIKit

class CacheData: CacheDataProtocol{
    
    //SRP
    let dataController = DataController() // Initialize DataController
    
    func cachePersons(data: [Datum], managedObjectContext: NSManagedObjectContext)  {
       
        for personData in data {
            let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id == %d", personData.id!)

            do {
                let results = try managedObjectContext.fetch(fetchRequest)
                if let existingPerson = results.first {
                    // Person with the same ID already exists, update the details if needed
                    
                    // Check if imageURL is not an empty string and set it
                    let imageURL = personData.pictureID?.pictures?["512"] ?? ""
                    if !imageURL.isEmpty {
                        existingPerson.imageURL = imageURL
                    }
                    
                    // Update name and organization
                    existingPerson.name = personData.name ?? "No Name"
                    existingPerson.organization = personData.orgName ?? "No Organization Name"
                    
                    // Update email relationships
                    if let personEmails = personData.email, !personEmails.isEmpty {
                        existingPerson.removeFromEmail(existingPerson.email ?? NSSet())
                        
                        let emailEntities = personEmails.compactMap { emailData -> EmailCoreData? in
                            guard let value = emailData.value, !value.isEmpty else {
                                return nil // Skip empty or nil values
                            }
                            
                            let emailEntity = EmailCoreData(context: managedObjectContext)
                            emailEntity.label = emailData.label
                            emailEntity.value = value
                            emailEntity.person = existingPerson
                            
                            return emailEntity
                        }
                        
                        existingPerson.addToEmail(NSSet(array: emailEntities))
                    } else {
                        // If the person has no emails in the JSON data, remove any existing email relationships
                        existingPerson.removeFromEmail(existingPerson.email ?? NSSet())
                    }



                    // Update phone relationships
                    if let personPhones = personData.phone, !personPhones.isEmpty {
                        existingPerson.removeFromPhone(existingPerson.phone ?? NSSet())
                        
                        let phoneEntities = personPhones.compactMap { phoneData -> PhoneCoreData? in
                            guard let label = phoneData.label, let value = phoneData.value else {
                                return nil // Skip nil or empty values
                            }
                            
                            let phoneEntity = PhoneCoreData(context: managedObjectContext)
                            phoneEntity.label = label
                            phoneEntity.value = value
                            phoneEntity.person = existingPerson
                            
                            return phoneEntity
                        }
                        
                        existingPerson.addToPhone(NSSet(array: phoneEntities))
                    } else {
                        // If the person has no phone data in the JSON, remove any existing phone relationships
                        existingPerson.removeFromPhone(existingPerson.phone ?? NSSet())
                    }


                    
                    dataController.save(context: managedObjectContext) // Save the changes
                } else {
                    // Create a new person entity if no existing person found with the ID
                    let newPerson = Person(context: managedObjectContext)
                    newPerson.id = Int32(personData.id!)
                    newPerson.name = personData.name
                    newPerson.organization = personData.orgName ?? "No Organization Name"
                    
                    // Set image
                    let imageURL = personData.pictureID?.pictures?["512"] ?? ""
                    if !imageURL.isEmpty {
                        newPerson.imageURL = imageURL
                      
                    
                    }
                    
                    // Establish email relationships for the new person
                    if let personEmails = personData.email {
                        newPerson.email = NSSet(array: personEmails.compactMap { emailData in
                            guard let label = emailData.label, let value = emailData.value else {
                                return nil
                            }
                            let emailEntity = EmailCoreData(context: managedObjectContext)
                            emailEntity.label = label
                            emailEntity.value = value
                            emailEntity.person = newPerson // Set relationship
                            
                            return emailEntity
                        })
                    }

                    // Establish phone relationships for the new person
                    if let personPhones = personData.phone {
                        newPerson.phone = NSSet(array: personPhones.compactMap { phoneData in
                            guard let label = phoneData.label, let value = phoneData.value else {
                                return nil
                            }
                            let phoneEntity = PhoneCoreData(context: managedObjectContext)
                            phoneEntity.label = label
                            phoneEntity.value = value
                            phoneEntity.person = newPerson // Set relationship
                            
                            return phoneEntity
                        })
                    }

                    
                    
                    dataController.save(context: managedObjectContext) // Save the new person
                }
            } catch {
                print("Error fetching or adding person: \(error.localizedDescription)")
            }
        }
    }
    
}
