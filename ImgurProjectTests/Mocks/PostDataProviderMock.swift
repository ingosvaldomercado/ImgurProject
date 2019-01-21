//
//  PostDataProviderMock.swift
//  ImgurProjectTests
//
//  Created by Osvaldo Mercado on 1/18/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
@testable import ImgurProject

class PostDataProviderMock: PostDataProviderType {
    var simulateError: Bool
    
    init(_ simulateError: Bool) {
        self.simulateError = simulateError
    }
    
    func fetchPosts(query: String, page: String, completionHandler completion: @escaping ([PostModelType], Error?) -> Void) {
        if (self.simulateError) {
            completion([],ErrorMock.network)
        } else {
            completion([PostModelMock()],nil)
        }
    }
}

enum ErrorMock: Error {
    case network
}
