//
//  customAsyncImage.swift
//  Pipedrive
//
//  Created by Shady Elkassas on 01/12/2023.
//

import SwiftUI
import CachedAsyncImage

struct customAsyncImage: View {
    
    //Injection
    let heightOfImage: CGFloat
    let url: String
    
    var body: some View {
        

        CachedAsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .empty:
                
                // Placeholder while the image is loading
                Circle()
                    .fill(Color.gray)
                    .frame(width: heightOfImage, height: heightOfImage)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    .shadow(radius: 1)
                
                
                
            case .success(let image):
                
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: heightOfImage, height: heightOfImage)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    .shadow(radius: 1)
                    
                
            case .failure(_):
                
                // Placeholder or error view if the image fails to load
                Image(systemName: "AppIcon" )
                    .frame(width: heightOfImage, height: heightOfImage)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    .shadow(radius: 1)
                
            @unknown default:
                
                // Placeholder for unknown state
                Image(systemName: "AppIcon")
                    .frame(width: heightOfImage, height: heightOfImage)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    .shadow(radius: 1)
                
            }
        }
    
    }
}

#Preview {
    customAsyncImage(heightOfImage: 100, url: "")
}



