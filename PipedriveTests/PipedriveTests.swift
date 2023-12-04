//
//  PipedriveTests.swift
//  PipedriveTests
//
//  Created by Shady Elkassas on 28/11/2023.
//

import XCTest
@testable import Pipedrive
import CoreData

class ViewModelTests: XCTestCase {
    
    var viewModel: ViewModel!
    var mockManagedObjectContext: NSManagedObjectContext!
    
    override func setUp() {
        super.setUp()
        
        viewModel = ViewModel()
        
        // Creating an in-memory persistent store for testing CoreData
        let managedObjectModel = NSManagedObjectModel.mergedModel(from: [Bundle.main])!
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        
        mockManagedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        mockManagedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
       
        
        viewModel.setManagedObjectContext(managedObjectContext: mockManagedObjectContext)
    }
    
    override func tearDown() {
        viewModel = nil
        mockManagedObjectContext = nil
        super.tearDown()
    }
    
    func testGetData() {
        let expectation = XCTestExpectation(description: "Fetch data expectation")
        let YOUR_API_TOKEN = "4f716e844c4b06a5a3c6badc8b69dc918047489c"
        
        guard let pipeDriveURL = URL(string: "https://api.pipedrive.com/v1/persons?api_token=\(YOUR_API_TOKEN)&start=0&limit=100") else {
            XCTFail("Failed to create URL")
            return
        }
        
        URLSession.shared.dataTask(with: pipeDriveURL) { data, response, error in
            defer {
                expectation.fulfill()
            }
            
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
                XCTFail("Invalid response")
                return
            }

            
            guard let data = data else {
                XCTFail("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(PersonModel.self, from: data)
                self.viewModel.PersonRoot = response
                self.viewModel.personsData = response.data ?? []
                 
                // Passes if there is data retreived
                XCTAssertFalse(self.viewModel.personsData.isEmpty)
               
                // Passes if the call is a 'success'
                XCTAssertTrue(self.viewModel.PersonRoot?.success ?? false)
                
                
                
            } catch {
                XCTFail("Error decoding data: \(error.localizedDescription)")
            }
        }.resume()
        
        wait(for: [expectation], timeout: 4.0) // Adjust the timeout as needed
    }
    




    
}
