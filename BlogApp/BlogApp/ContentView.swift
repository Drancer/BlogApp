//
//  ContentView.swift
//  BlogApp
//
//  Created by Karthikaideepan on 20/05/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var blogViewModel = BlogViewModel()
    
    var body: some View {
        
        NavigationStack {
            List(blogViewModel.blogs) { blog in
                NavigationLink(value: blog) {
                    BlogItemView(blog: blog)
                }
            }.navigationTitle("Blogs")
                .navigationDestination(for: Blog.self, destination: { blog in
                    BlogItemDetailsView(blog: blog)
                })
            .task {
                await blogViewModel.getBlogs()
            }
        }.alert(isPresented: $blogViewModel.showError, content: {
            Alert(title:Text("Infromation"), message: Text(blogViewModel.error?.message ?? ""))
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
