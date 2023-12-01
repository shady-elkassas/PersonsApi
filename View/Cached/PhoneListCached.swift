//
//  PhoneListSubView.swift
//  Pipedrive
//
//  Created by Shady Elkassas on 30/11/2023.
//

import SwiftUI

struct PhoneListCached: View {
    
    // Injected
    var person: FetchedResults<Person>.Element

    // Accessibility
    var sizeIncrement: Int
    
    // Color Scheme
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        if let personPhones = person.phone as? Set<PhoneCoreData>, !personPhones.isEmpty {
            VStack {
                ForEach(Array(personPhones), id: \.id) { phone in // Use Array() to convert Set to Array
                    
                    HStack {
                        Image(systemName: phone.label == "work" ?  "network" : "house.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding()
                        
                        Text(phone.value ?? "" + " (\(phone.label ?? ""))")
                            .font(.system(size: CGFloat(16 + sizeIncrement), weight: .regular, design: .default))
                            .foregroundColor(colorScheme == .light ? Color(UIColor.darkGray) : .white)
                            .italic()
                            .underline()
                            .onTapGesture {
                                if let phoneValue = phone.value, let phoneURL = URL(string: "tel://\(phoneValue)") {
                                    UIApplication.shared.open(phoneURL)
                                }
                            }
                        
                        Spacer()
                    }
                    
                }
            }
        } else {
            HStack{
                Text("No Phone Numbers Provided...")
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
//    PhoneListSubView()
//}
