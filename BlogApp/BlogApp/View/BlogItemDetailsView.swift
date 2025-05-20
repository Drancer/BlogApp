//
//  BlogItemDetailsView.swift
//  BlogApp
//
//  Created by Karthikaideepan on 20/05/25.
//

import SwiftUI

struct BlogItemDetailsView: View {
    var blog: Blog
    var body: some View {
        VStack(alignment: .leading, content: {
            Text(blog.title).font(Font.title)
            AsyncImage(url: URL(string: blog.imageUrl)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Text("Loading")
            }
            Text(blog.summary)
                .padding([.top], 10)
            Spacer()
        }).navigationBarTitleDisplayMode(.inline)
        .padding(10)
    }
}
