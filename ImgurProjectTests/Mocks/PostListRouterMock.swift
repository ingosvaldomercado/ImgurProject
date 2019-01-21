//
//  PostListRouterMock.swift
//  ImgurProjectTests
//
//  Created by Osvaldo Mercado on 1/18/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
import UIKit
import XCTest
@testable import ImgurProject

class PostListRouterMock: PostListRouterType {
    var baseView: UIViewController?
    let expectation = XCTestExpectation(description: "Router called")
    
    func open(model: PostModelType, segue: UIStoryboardSegue) {
        expectation.fulfill()
    }
}
