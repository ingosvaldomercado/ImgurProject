//
//  PostListRouter.swift
//  ImgurProject
//
//  Created by Osvaldo Mercado on 1/14/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
import UIKit

protocol PostListRouterType: RouterType {
    func open(model: PostModelType, segue: UIStoryboardSegue)
}

class PostListRouter: PostListRouterType {
    weak var baseView: UIViewController?
    var detailsBuilder: PostDetailBuilder?
    
    func open(model: PostModelType, segue: UIStoryboardSegue) {
        guard let destinationVC = segue.destination as? PostDetailViewController else { return }
        
        let builder = PostDetailBuilder(model: model, delegate: self)
        builder.build(view: destinationVC)
        detailsBuilder = builder
    }
}

extension PostListRouter: PostDetailBuilderDelegate {
    func didCloseDetailsModule() {
        detailsBuilder = nil
        baseView?.dismiss(animated: true, completion: nil)
    }
}
