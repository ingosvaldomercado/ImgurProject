//
//  PostListInteractorMock.swift
//  ImgurProjectTests
//
//  Created by Osvaldo Mercado on 1/18/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
@testable import ImgurProject

class PostListInteractorMock: PostListInteractorType {
    var delegate: PostListInteractorDelegate?
    
    func fetchPosts(query: String, page: String) {
        if !query.elementsEqual("error") {
            delegate?.noticeFetchedSuccess(posts: [PostModelMock()])
        } else {
            delegate?.noticeFetchFailed()
        }
    }
}
