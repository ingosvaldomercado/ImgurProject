//
//  PostDetailPresenterDelegateMock.swift
//  ImgurProjectTests
//
//  Created by Osvaldo Mercado on 1/21/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
import XCTest
@testable import ImgurProject

class PostDetailPresenterDelegateMock: PostDetailPresenterDelegate {
    let expectation = XCTestExpectation(description: "Delegate called")
    
    func didUpdate(viewModel: PostDetailViewModelType) {
        expectation.fulfill()
    }
}
