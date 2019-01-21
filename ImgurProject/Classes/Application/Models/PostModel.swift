//
//  PostModel.swift
//  ImgurProject
//
//  Created by Osvaldo Mercado on 1/11/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
import ObjectMapper

protocol PostModelType {
    var id: Int? { get set }
    var title: String? { get set }
    var topic: String? { get set }
    var favorite_count: Int? { get set }
    var points: Double? { get set }
    var score: Double? { get set }
    var is_album: Bool? { get set }
    var images_count: Int? { get set }
    var images: [ImageModel]? { get set }
    var coverImage: URL? { get }
}

struct PostModel: Mappable, PostModelType
{
    var id: Int?
    var title: String?
    var topic: String?
    var favorite_count: Int?
    var points: Double?
    var score: Double?
    var is_album: Bool?
    var images_count: Int?
    var images: [ImageModel]?
    var coverImage: URL? {
        guard
            let images = self.images,
            let mainImage = images.first,
            let urlLink = mainImage.link,
            let url = URL(string: urlLink)
            else {
                return nil
        }
        
        return url
    }
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        id              <- map["id"]
        title           <- map["title"]
        topic           <- map["topic"]
        favorite_count  <- map["favorite_count"]
        points          <- map["points"]
        score           <- map["score"]
        is_album        <- map["is_album"]
        images_count    <- map["images_count"]
        images          <- map["images"]
    }
}
