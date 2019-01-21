//
//  PostDetailRouterMock.swift
//  ImgurProjectTests
//
//  Created by Osvaldo Mercado on 1/21/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
import UIKit
import XCTest
@testable import ImgurProject

class PostDetailRouterMock: PostDetailRouterType {
    var baseView: UIViewController?
    let expectation = XCTestExpectation(description: "Router called")
    
    func close() {
        expectation.fulfill()
    }
}
