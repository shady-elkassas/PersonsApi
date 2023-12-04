//
//  listItemCached.swift
//  Pipedrive
//
//  Created by Shady Elkassas on 30/11/2023.
//

import SwiftUI
import Shimmer
import CoreData

struct listItemCached: View {
    
    // Injected
    var person: FetchedResults<Person>.Element
    
    //  Height of Image
    @State var heightOfImage:CGFloat
    
    // Accessibility
    var sizeIncrement: Int
    
    var body: some View {
        
        HStack {
            
            // Image
            customAsyncImage(heightOfImage: heightOfImage, url: person.imageURL ?? "")
            
            
            VStack(alignment: .leading, spacing: 10){
                
                // Name
                Text(person.name ?? "No Name")
                    .font(.system(size: CGFloat(18 + sizeIncrement), weight: .bold, design: .default))
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                
                // Organization
                Text(person.organization ?? "No Organization Name")
                    .font(.system(size: CGFloat(16 + sizeIncrement), weight: .regular, design: .default))
                    .foregroundColor(Color(UIColor.darkGray))
                    .multilineTextAlignment(.leading)

                
                // Phone Number
                if let phones = person.phone as? Set<PhoneCoreData>, let firstPhone = phones.first {
                    Text(firstPhone.value ?? "No Phone Number")
                        .font(.system(size: CGFloat(14 + sizeIncrement), weight: .light, design: .default))
                        .foregroundColor(Color.gray)
                } else {
                    Text("No Phone Number")
                        .font(.system(size: CGFloat(14 + sizeIncrement), weight: .light, design: .default))
                        .foregroundColor(Color.gray)
                }

                
            }
            .padding()
            
            Spacer() // Add spacer to push VStack to the left
            
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 1)
    }
}


//#Preview {
//    listItemCached(personData: dummyPerson.data.first!)
//}
