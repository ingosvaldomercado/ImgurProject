//
//  PostListInteractor.swift
//  ImgurProject
//
//  Created by Osvaldo Mercado on 1/11/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation

protocol PostListInteractorDelegate {
    func noticeFetchedSuccess(posts: [PostModelType])
    func noticeFetchFailed()
}

protocol PostListInteractorType: InteractorType {
    func fetchPosts(query: String, page: String)
}

final class PostListInteractor: PostListInteractorType
{
    var delegate: PostListInteractorDelegate?
    var postDataProvider: PostDataProviderType
    
    init() {
        self.postDataProvider = ServiceDataProvider()
    }
    
    func fetchPosts(query: String, page: String) {
        self.postDataProvider.fetchPosts(query: query, page: page) { (posts, error) in
            if error == nil {
                self.delegate?.noticeFetchedSuccess(posts: posts)
            } else {
                self.delegate?.noticeFetchFailed()
            }
        }
    }
}


