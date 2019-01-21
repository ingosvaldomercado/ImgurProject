//
//  PostListPresenterDelegateMock.swift
//  ImgurProjectTests
//
//  Created by Osvaldo Mercado on 1/18/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
import XCTest
@testable import ImgurProject

class PostListPresenterDelegateMock: PostListPresenterDelegate {
    let expectation = XCTestExpectation(description: "Presenter called")
    
    func displayFetchedPosts(viewModels: [PostListItemViewModelType]) {
        expectation.fulfill()
    }
    
    func showError() {
        expectation.fulfill()
    }
}
