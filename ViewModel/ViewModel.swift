//
//  ViewModel.swift
//  Pipedrive
//
//  Created by Shady Elkassas on 28/11/2023.
//

import Foundation
import CoreData

class ViewModel: ObservableObject, RetreiveDataProtocol{
    
    // SRP
    private var caheData: CacheData = CacheData()
    
    // Context
    var managedObjectContext: NSManagedObjectContext?
    
    //Data
    var PersonRoot:PersonModel?
    var nextStart: Int = 0 // For Pagination
    
    // Published variable (Users Data)
    @Published var personsData:[Datum] = []
    
    func setManagedObjectContext(managedObjectContext: NSManagedObjectContext) {
           self.managedObjectContext = managedObjectContext
    }
    
    // Retreive data
    func getData() async{
        
        guard let url = URL(string: "https://api.pipedrive.com/v1/persons?api_token=\(API_KEY)&start=\(nextStart)&limit=100") else{
            print("Error in API's URL")
            return
        }

        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let response = try decoder.decode(PersonModel.self, from: data)
               
            self.PersonRoot = response
           
            if(API_KEY != "YOUR_API_KEY"){
                //Cache Persons
                caheData.cachePersons(data: response.data ?? [], managedObjectContext: managedObjectContext!)
            }
           

            // Update the published value on the main thread
            DispatchQueue.main.async { [weak self] in
                self?.personsData = response.data ?? []
                
                print("Responses' names are: \(self?.personsData.map { $0.name } ?? [])")
            }

            
           } catch {
               print("Error fetching data: \(error.localizedDescription)")
           }
        
    }
    
    
}
