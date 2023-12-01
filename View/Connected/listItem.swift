//
//  listItem.swift
//  Pipedrive
//
//  Created by Shady Elkassas on 28/11/2023.
//

import SwiftUI
import Shimmer

struct listItem: View {
    
    // Injected
    let personData: Datum
    
    //  Height of Image
    @State var heightOfImage:CGFloat
    
    // Accessibility
    var sizeIncrement: Int
    
    var body: some View {
        
        HStack {
            
            // Image
            customAsyncImage(heightOfImage: heightOfImage, url: personData.pictureID?.pictures?["512"] ?? "")
            
            VStack(alignment: .leading, spacing: 10){
                
                // Name
                Text(personData.name ?? "No Name")
                    .font(.system(size: CGFloat(18 + sizeIncrement), weight: .bold, design: .default))
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                
                // Organization
                Text(personData.orgName ?? "No Organization Name")
                    .font(.system(size: CGFloat(16 + sizeIncrement), weight: .regular, design: .default))
                    .foregroundColor(Color(UIColor.darkGray))
                    .multilineTextAlignment(.leading)

                
                // Phone Number
                Text(personData.phone?.first?.value ?? "No Number")
                    .font(.system(size: CGFloat(14 + sizeIncrement), weight: .light, design: .default))
                    .foregroundColor(Color.gray)
                
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
//    listItem(personData: dummyPerson.data.first!)
//}
