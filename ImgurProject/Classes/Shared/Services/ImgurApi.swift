//
//  ImgurApi.swift
//  ImgurProject
//
//  Created by Osvaldo Mercado on 1/11/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

struct Contants
{
    static let apiKey = "client-id 126701cd8332f32"
    static let homePath = "https://api.imgur.com/3/gallery/search/time/"
}

final class ImgurApi: PostDataProviderType
{
    func fetchPosts(query: String, page: String, completionHandler completion: @escaping ([PostModelType], Error?) -> Void) {
        
        let urlString = Contants.homePath + page + "?q=" + query
        
        let headers: HTTPHeaders = ["Authorization":Contants.apiKey]
        
        Alamofire
            .request(urlString, headers: headers)
            .responseJSON { response in
                
                if(response.response?.statusCode == 200) {
                    if let json = response.result.value as AnyObject? {
                        let arrayResponse = json["data"] as? [Any]
                        let arrayObject = Mapper<PostModel>().mapArray(JSONArray: arrayResponse as! [[String : Any]])
                        completion(arrayObject, nil)
                    }
                }else {
                    completion([], response.error)
                }
        }
    }
}
