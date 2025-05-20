//
//  BlogNewsServiceTests.swift
//  BlogAppTests
//
//  Created by Karthikaideepan on 20/05/25.
//

import XCTest
@testable import BlogApp

final class BlogNewsServiceTests: XCTestCase {
    var blogService:BlogService!
    override func setUpWithError() throws {
        blogService = NewsService(baseUrl: "https://api.spaceflightnewsapi.net/v4/test/")
    }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testNetworkService_Notfound() async throws {
        let result = await blogService.getBlogs()
        switch result {
        case .success(_):
            break;
        case .failure(let error):
            XCTAssertTrue(error == NetworkError.notfound)
        }
    }

}
