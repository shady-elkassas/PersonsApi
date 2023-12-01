//
//  PipedriveApp.swift
//  Pipedrive
//
//  Created by Shady Elkassas on 28/11/2023.
//

import SwiftUI

@main
struct PipedriveApp: App {
    
    @StateObject private var dataController: DataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
