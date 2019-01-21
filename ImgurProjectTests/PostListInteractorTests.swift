//
//  PostListInteractorTests.swift
//  ImgurProjectTests
//
//  Created by Osvaldo Mercado on 1/18/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import XCTest
@testable import ImgurProject

class PostListInteractorTests: XCTestCase {
    
    var sut: PostListInteractor?
    let delegate = PostListInteractorDelegateMock()
    
    override func setUp() {
        super.setUp()
        sut = PostListInteractor()
    }
    
    func test_FetchPost_GivenDataProvider_ShouldNoticeFetchedSuccess() {
        // Given
        sut?.delegate = delegate
        sut?.postDataProvider = PostDataProviderMock(false)
        
        // When
        sut?.fetchPosts(query: "", page: "")
        
        // Then
        wait(for: [delegate.expectation], timeout: 1.0)
    }
    
    func test_FetchPost_GivenDataProvider_ShouldNoticeFetchFailed() {
        // Given
        sut?.delegate = delegate
        sut?.postDataProvider = PostDataProviderMock(true)
        
        // When
        sut?.fetchPosts(query: "", page: "")
        
        // Then
        wait(for: [delegate.expectation], timeout: 1.0)
    }
}
