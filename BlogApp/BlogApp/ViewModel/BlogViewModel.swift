//
//  BlogViewModel.swift
//  BlogApp
//
//  Created by Karthikaideepan on 20/05/25.
//

import Foundation

class BlogViewModel: ObservableObject {
    
    @Published var blogs:[Blog] = [Blog]()
    let service: BlogService = NewsService()
    @Published var error:ErrorInfo?
    @Published var showError = false
    
    func getBlogs() async {
        let result = await service.getBlogs()
        switch result {
        case .success(let blogResponse):
            DispatchQueue.main.async {
                self.blogs = blogResponse.results
            }
        case .failure(let error):
            DispatchQueue.main.async {
                self.showError = true
                self.error = ErrorInfo(message: error.localizedDescription)
            }
        }
    }
}
