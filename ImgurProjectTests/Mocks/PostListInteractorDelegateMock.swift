//
//  PostListInteractorDelegateMock.swift
//  ImgurProjectTests
//
//  Created by Osvaldo Mercado on 1/16/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
import XCTest
@testable import ImgurProject

class PostListInteractorDelegateMock: PostListInteractorDelegate {
    let expectation = XCTestExpectation(description: "Interactor called")
    
    func noticeFetchedSuccess(posts: [PostModelType]) {
        expectation.fulfill()
    }
    
    func noticeFetchFailed() {
        expectation.fulfill()
    }
}
