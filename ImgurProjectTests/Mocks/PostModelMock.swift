//
//  PostModelMock.swift
//  ImgurProjectTests
//
//  Created by Osvaldo Mercado on 1/18/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
@testable import ImgurProject

struct PostModelMock: PostModelType {
    var id: Int? = 1
    var title: String? = "title"
    var topic: String? = "topic"
    var favorite_count: Int? = 1
    var points: Double? = 40
    var score: Double? = 10
    var is_album: Bool? = true
    var images_count: Int? = 1
    var images: [ImageModel]? = []
    var coverImage: URL? = URL(string: "http://url.com")
}
