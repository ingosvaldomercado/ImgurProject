//
//  PostDetailRouter.swift
//  ImgurProject
//
//  Created by Osvaldo Mercado on 1/14/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
import UIKit

protocol PostDetailRouterDelegate: class {
    func didClosePostDetails()
}

protocol PostDetailRouterType: RouterType {
    func close()
}

class PostDetailRouter: PostDetailRouterType {
    var baseView: UIViewController?
    weak var delegate: PostDetailRouterDelegate?
    
    func close() {
        delegate?.didClosePostDetails()
    }
}
