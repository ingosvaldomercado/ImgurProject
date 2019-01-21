//
//  PostListItemViewModel.swift
//  ImgurProject
//
//  Created by Osvaldo Mercado on 1/15/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation

protocol PostListItemViewModelType: ViewModelType {
    var title: String? { get }
    var image: URL? { get }
    var postModel: PostModelType? { get }
}

struct PostListItemViewModel: PostListItemViewModelType {
    var title: String?
    var image: URL?
    var postModel: PostModelType?
}
