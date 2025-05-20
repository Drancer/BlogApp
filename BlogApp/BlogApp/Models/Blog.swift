//
//  Blog.swift
//  BlogApp
//
//  Created by Karthikaideepan on 20/05/25.
//

import Foundation

struct Blog: Identifiable, Hashable, Codable {
    let id: Int
    let title: String
    let summary: String
    let imageUrl: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case summary = "summary"
        case imageUrl = "image_url"
    }
}

struct BlogResponse: Codable {
    let results: [Blog]
}

struct ErrorInfo {
    let message: String
}
