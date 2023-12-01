//
//  splashScreen.swift
//  Pipedrive
//
//  Created by Shady Elkassas on 01/12/2023.
//

import SwiftUI

struct splashScreenView: View {
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    @StateObject private var dataController: DataController = DataController()

    
    var body: some View {
        
        if(isActive){
          
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
            
        }else{
            
            ZStack{
                
                Color.black.ignoresSafeArea()
                
                VStack{
                    Image("logo")
                        .resizable()
                        .frame(width: 200,height: 200)
                        .cornerRadius(10)
                    
                   
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.2)){
                        
                        self.size = 0.9
                        self.opacity = 1.0
                        
                    }
                }
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    self.isActive = true
                }
            }
        }
        
    }
    
}

#Preview {
    splashScreenView()
}
