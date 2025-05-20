//
//  BlogItemView.swift
//  BlogApp
//
//  Created by Karthikaideepan on 20/05/25.
//

import SwiftUI

struct BlogItemView: View {
    let blog: Blog
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: blog.imageUrl)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:100)
            } placeholder: {
                Image("placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:100)
            }
            Text(blog.title)
            
        }
        
    }
    
}
