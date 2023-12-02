//
//  EmailListSubView.swift
//  Pipedrive
//
//  Created by Shady Elkassas on 30/11/2023.
//

import SwiftUI
import CoreData

struct EmailListCached: View {
    
    // Injected
    var person: FetchedResults<Person>.Element
    
    // Accessibility
    var sizeIncrement: Int

    // Color Scheme
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        if let personEmails = person.email as? Set<EmailCoreData>, !personEmails.isEmpty {
            VStack {
                ForEach(Array(personEmails), id: \.id) { email in // Use Array() to convert Set to Array
                    
                    HStack {
                        Image(systemName: email.label == "home" ?  "house.fill":"network" )
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding()
                        
                        Text(email.value ?? "" + " (\(email.label ?? ""))")
                            .font(.system(size: CGFloat(16 + sizeIncrement), weight: .regular, design: .default))
                            .foregroundColor(colorScheme == .light ? Color(UIColor.darkGray) : .white)
                            .italic()
                            .underline()
                            .onTapGesture {
                               
                                if let emailValue = email.value, emailValue != "", let emailURL = URL(string: "mailto:\(emailValue)") {
                                                                  
                                    UIApplication.shared.open(emailURL)
                                                             
                                }
                                
                            }
                        
                        Spacer()
                    }
                    
                }
            }
        } else {
            
            HStack{
                Text("No Emails provided...")
                    .font(.system(size: CGFloat(16 + sizeIncrement), weight: .regular, design: .default))
                    .foregroundColor(Color(UIColor.darkGray))
                    .italic()
                    .padding()
                
                Spacer()
            }
           
        }
    }
}


//#Preview {
//    EmailListSubView()
//}
