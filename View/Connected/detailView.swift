//
//  detailView.swift
//  Pipedrive
//
//  Created by Shady Elkassas on 29/11/2023.
//

import SwiftUI
import Shimmer

struct detailView: View {
    
    // Color Scheme
    @Environment(\.colorScheme) var colorScheme
    
    // Injected
    var personData: Datum
    
    //  Height of Image
    @State var heightOfImage:CGFloat
    
    // Accessibility
    var sizeIncrement: Int
    
    var body: some View {
        
        GeometryReader{ geometry in
        
       
            VStack {
                
                ScrollView{
                
                //Image
                    customAsyncImage(heightOfImage: heightOfImage, url: personData.pictureID?.pictures?["512"] ?? "")
                
                Spacer().frame(height: 20)
                
                // Name
                Text(personData.name ?? "No Name")
                    .font(.system(size: 28, weight: .bold, design: .default))
                    .padding()
                
                
                // Organization
                    Text(personData.orgName ?? "No Organization Name")
                    .font(.system(size: 18, weight: .regular, design: .default))
                    .foregroundColor(Color(UIColor.darkGray))
                    .italic()
                
                Spacer().frame(height: 20)
                    
                //Emails
                HStack{
                    Text("Email(s)")
                        .font(.system(size: 28, weight: .bold, design: .default))
                        .padding(.horizontal)
                    
                    // To push title to the left
                    Spacer()
                }
                
                EmailListConnected(personData: personData, sizeIncrement: sizeIncrement)
                
                Spacer().frame(height: 20)
                
                // Phone numbers
                HStack{
                    Text("Phone(s)")
                        .font(.system(size: 28, weight: .bold, design: .default))
                        .padding(.horizontal)
                    
                    // To push title to the left
                    Spacer()
                }
                
                PhoneListConnected(personData: personData, sizeIncrement: sizeIncrement )
                
                
                Spacer() // Spacer to push the content to the top
                
            }
                
            }.frame(height: geometry.size.height)
            
            
        
       
    }
              
               
    }
}

//#Preview {
//    
//    
//    detailView(personData: dummyPerson.data.last!)
//}
