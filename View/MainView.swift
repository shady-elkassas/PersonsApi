//
//  ContentView.swift
//  Pipedrive
//
//  Created by Shady Elkassas on 28/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.colorScheme) var colorScheme
    
    // VM
    @StateObject var viewModel = ViewModel()
    
    // Accessibility
    @State var accessibilitySize: Int = 0
    @State var isBigText: Bool = false
    
    // For network status
    @ObservedObject var networkMonitor = NetworkMonitor()
    
   // Retreive data from database
   @FetchRequest(entity: Person.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Person.id, ascending: true)]
) var personsCoreData: FetchedResults<Person>

  
    
    var body: some View {
        
            GeometryReader{ geometry in
                
                NavigationView {
                    ZStack {
                        
                        Color.gray.opacity(0.1).ignoresSafeArea()
                        
                        
                        ScrollView {
                            
                            VStack(spacing: 16) {
                                
                                if(networkMonitor.isConnected){
                                    ForEach(viewModel.personsData, id: \.id) { person in
                                        NavigationLink(destination: detailView(personData: person, heightOfImage: geometry.size.height/4, sizeIncrement: accessibilitySize)) {
                                            listItem(personData: person, heightOfImage: geometry.size.height/6, sizeIncrement: accessibilitySize)
                                                .frame(width: geometry.size.width*0.9)
                                            
                                        }
                                    }
                                    .padding(.top)
                                }else{
                                    
                                    ForEach(personsCoreData, id: \.id) { person in
                                        
                                        NavigationLink(destination: detailViewCached(person: person, heightOfImage: geometry.size.height/4, sizeIncrement: accessibilitySize)) {
                                            listItemCached(person: person,heightOfImage: geometry.size.height/6, sizeIncrement: accessibilitySize)
                                                .frame(width: geometry.size.width*0.9)
                                        }
                                    }
                                    .padding(.top)
                                    
                                }
                                
                                Spacer()
                                
                            }
                            .navigationTitle("Persons")
                            
                        }
                        
                        
                    }
                    .toolbar{
                        ToolbarItem(placement: .topBarTrailing) {
                            
                            if isBigText{
                                
                                Button {
                                    isBigText.toggle()
                                    accessibilitySize = 0
                                } label: {
                                    Image(systemName: "character")
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                        .foregroundColor(colorScheme == .light ? .black:.white)
                                        .padding()
                                }
                                
                                
                                
                            }else{
                                Button {
                                    isBigText.toggle()
                                    accessibilitySize = 4
                                } label: {
                                    Image(systemName: "character")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .foregroundColor(colorScheme == .light ? .black:.white)
                                        .padding()
                                    
                                }
                            }
                            
                        }
                    }
                    
                }
                .accentColor(colorScheme == . light ? .black : .white)
                .onAppear(perform: {
                    
                    viewModel.setManagedObjectContext(managedObjectContext: managedObjectContext)
                    
                    Task {
                        await viewModel.getData()
                    }
                })
                
                .navigationViewStyle(StackNavigationViewStyle())
            }
        
    

        
       
    }
}


#Preview {
    ContentView()
}
