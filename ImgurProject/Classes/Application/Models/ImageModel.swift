//
//  ImageModel.swift
//  ImgurProject
//
//  Created by Osvaldo Mercado on 1/11/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
import ObjectMapper

protocol ImageModelType {
    var id: Int? { get set }
    var title: String? { get set }
    var type: String? { get set }
    var link: String? { get set }
}

struct ImageModel: Mappable, ImageModelType
{
    var id: Int?
    var title: String?
    var type: String?
    var link: String?
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        id      <- map["id"]
        title   <- map["title"]
        type    <- map["type"]
        link    <- map["link"]
    }
}
