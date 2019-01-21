//
//  PostDetailViewModelMock.swift
//  ImgurProjectTests
//
//  Created by Osvaldo Mercado on 1/21/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
@testable import ImgurProject

struct PostDetailViewModelMock: PostDetailViewModelType {
    var title: String? = "title"
    var description: String? = "description"
    var image: URL? = URL(string: "http://url.com")
}
