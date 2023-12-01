//
//  detailViewCached.swift
//  Pipedrive
//
//  Created by Shady Elkassas on 30/11/2023.
//


import SwiftUI
import Shimmer
import CoreData

struct detailViewCached: View {
    
    // Color Scheme
    @Environment(\.colorScheme) var colorScheme
    
    // Injected
    var person: FetchedResults<Person>.Element
    
    //  Height of Image
    let heightOfImage:CGFloat
    
    // Accessibility
    var sizeIncrement: Int
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 20) {
      
                Spacer().frame(height: heightOfImage/2)

                // Image
                customAsyncImage(heightOfImage: heightOfImage, url: person.imageURL ?? "")
    
                
                // Name
                Text(person.name ?? "No Name")
                    .font(.system(size: CGFloat(28 + sizeIncrement), weight: .bold, design: .default))
                    .padding()
                
                
                // Organization
                Text(person.organization ?? "No Organization")
                    .font(.system(size: CGFloat(18 + sizeIncrement), weight: .regular, design: .default))
                    .foregroundColor(Color(UIColor.darkGray))
                    .italic()
                
                
                //Emails
                    HStack{
                        Text("Email(s)")
                            .font(.system(size: CGFloat(28 + sizeIncrement), weight: .bold, design: .default))
                            .padding(.horizontal)
                        
                        // To push title to the left
                        Spacer()
                    }
                    
                EmailListCached(person: person, sizeIncrement: sizeIncrement)
                
                
                // Phone numbers
                HStack{
                    Text("Phone(s)")
                        .font(.system(size: CGFloat(28 + sizeIncrement), weight: .bold, design: .default))
                        .padding(.horizontal)
                    
                    // To push title to the left
                    Spacer()
                }
                
                PhoneListCached(person: person, sizeIncrement: sizeIncrement)
                
                
                
                Spacer() // Spacer to push the content to the top
                
        
                
            }.frame(height: UIScreen.main.bounds.height)
            
            
        }
        .ignoresSafeArea()
     
              
               
    }
}

//#Preview {
//
//
//    detailViewCached(personData: dummyPerson.data.last!)
//}
