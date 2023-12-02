//
//  PhoneListConnected.swift
//  Pipedrive
//
//  Created by Shady Elkassas on 01/12/2023.
//

import SwiftUI

struct PhoneListConnected: View {
    
    // Injected
    var personData: Datum

    // Accessibility
    var sizeIncrement: Int
    
    // Color Scheme
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
       
        if let phones = personData.phone, !phones.isEmpty{
            VStack{
               
                ForEach(phones, id: \.value){ phone in
                    
                    HStack{
                        
                        Image(systemName: phone.label == "work" ? "network" : "house.fill" )
                            .resizable()
                            .frame(width: 20,height: 20)
                            .padding()
                        
                        
                        Text((phone.value ?? "") + " " + "(\(phone.label ?? "No Phones"))")
                            .font(.system(size: CGFloat(16 + sizeIncrement), weight: .regular, design: .default))
                            .foregroundColor(colorScheme == . light ? Color(UIColor.darkGray) : .white)
                            .italic()
                            .underline()
                            .onTapGesture {
                                    
                                if let phone = phone.value, phone != "", let url =  URL(string: "tel://\(phone)") {
                                       
                                    UIApplication.shared.open(url)
                        
                                }

                            }
                            
                        
                        Spacer()
                        
                    }
                    
                }
                
            }
        }else{
            Text("No phones provided...")
                .font(.system(size: CGFloat(16 + sizeIncrement), weight: .regular, design: .default))
                .foregroundColor(Color(UIColor.darkGray))
                .italic()
        }

    }
}

//#Preview {
//    PhoneListConnected()
//}
