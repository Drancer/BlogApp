//
//  BlogViewModelTests.swift
//  BlogAppTests
//
//  Created by Karthikaideepan on 20/05/25.
//

import XCTest
@testable import BlogApp

final class BlogViewModelTests: XCTestCase {
    var viewmodel: BlogViewModel!
    override func setUpWithError() throws {
        viewmodel = BlogViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBlogService() async throws {
        await viewmodel.getBlogs()
        XCTAssertTrue(viewmodel.blogs.count != 0)
    }

}
