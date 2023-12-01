//
//  EmailListConnected.swift
//  Pipedrive
//
//  Created by Shady Elkassas on 01/12/2023.
//

import SwiftUI

struct EmailListConnected: View {
   
    // Injected
    var personData: Datum

    // Accessibility
    var sizeIncrement: Int
    
    // Color Scheme
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        if let emails = personData.email, !emails.isEmpty{
            VStack{
               
                ForEach(emails, id: \.value){ email in
                    
                    HStack{
                        
                        Image(systemName: email.label == "home" ? "house.fill" : "network")
                            .resizable()
                            .frame(width: 20,height: 20)
                            .padding()
                        
                        Text((email.value ?? "") + " " + "(\(email.label ?? "No Emails"))")
                            .font(.system(size: CGFloat(16 + sizeIncrement), weight: .regular, design: .default))
                            .foregroundColor(colorScheme == . light ? Color(UIColor.darkGray) : .white)
                            .italic()
                            .underline()
                            .onTapGesture {
                
                                if let emailURL = URL(string: "mailto:\(String(describing: email.value))") {
                                    UIApplication.shared.open(emailURL)
                                }
                
                            }
                            
                        
                        Spacer()
                        
                    }
                    
                }
                
            }
        }else{
            Text("No emails provided...")
                .font(.system(size: CGFloat(16 + sizeIncrement), weight: .regular, design: .default))
                .foregroundColor(Color(UIColor.darkGray))
                .italic()
        }

    }
}

//#Preview {
//    EmailListConnected()
//}
