//
//  PostDetailViewModel.swift
//  ImgurProject
//
//  Created by Osvaldo Mercado on 1/15/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation

protocol PostDetailViewModelType: ViewModelType {
    var title: String? { get }
    var description: String? { get }
    var image: URL? { get }
}

struct PostDetailViewModel: PostDetailViewModelType {
    var title: String?
    var description: String?
    var image: URL?
}
