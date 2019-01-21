//
//  ServiceDataProvider.swift
//  ImgurProject
//
//  Created by Osvaldo Mercado on 1/11/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation

/// Enum that represents service errors
enum ServiceError: Error
{
    case notConnectivity
    case serviceError(String)
    case unknown
}

enum ServiceResult<T>
{
    case Success(result: T)
    case Failure(error: ServiceError)
}

protocol PostDataProviderType
{
    func fetchPosts(query: String, page: String, completionHandler completion: @escaping ([PostModelType], Error?) -> Void)
}

class ServiceDataProvider: PostDataProviderType
{
    
    init() {
        postDataProvider = ImgurApi()
    }
    
    var postDataProvider: PostDataProviderType
    
    func fetchPosts(query: String, page: String, completionHandler completion: @escaping ([PostModelType], Error?) -> Void) {
        postDataProvider.fetchPosts(query: query, page: page, completionHandler: completion)
    }
}
