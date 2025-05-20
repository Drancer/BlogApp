//
//  NewsService.swift
//  BlogApp
//
//  Created by Karthikaideepan on 20/05/25.
//

import SwiftUI

enum NetworkError: LocalizedError {
    case notfound
    case decodingError
    case unknownError
    case urlSessionError
    case urlError
    
    var errorDescription: String? {
        switch self {
        case .notfound:
            return "Service not found"
        case .decodingError:
            return "Unable to decode the data"
        case .unknownError:
            return "Something went wrong. Please try again"
        case .urlSessionError:
            return "Time out"
        case .urlError:
            return "Issue in Url"
        }
    }
}

protocol ErrorHandler {
    func parseError(data: Data, response:URLResponse) throws
}

protocol BlogService {
    func getBlogs() async -> Result<BlogResponse, NetworkError>
}
class NewsService: ErrorHandler {
    private let baseUrl = "https://api.spaceflightnewsapi.net/v4"
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = Constants.timeout
        let session = URLSession(configuration: config)
        return session
    } ()
}

extension NewsService: BlogService {
    func getBlogs() async -> Result<BlogResponse, NetworkError> {
        guard let url = URL(string: "\(baseUrl)/blogs/") else {
            return .failure(NetworkError.urlError)
        }
        let requestResult:(data:Data, response:URLResponse)
        do {
            requestResult = try await session.data(from: url)
        } catch {
            return .failure(NetworkError.urlSessionError)
        }
        do {
            try self.parseError(data: requestResult.data, response: requestResult.response)
        } catch {
            return .failure(error as! NetworkError)
        }
        do {
            let result = try JSONDecoder().decode(BlogResponse.self, from: requestResult.data)
            return .success(result)
        } catch {
            return .failure(NetworkError.decodingError)
        }
    }
}

extension ErrorHandler {
    func parseError(data: Data, response:URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 else {
            return
        }
        if httpResponse.statusCode == 404 {
            throw NetworkError.notfound
        }
        throw NetworkError.unknownError
    }
}
