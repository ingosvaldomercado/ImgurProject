//
//  PostListBuilder.swift
//  ImgurProject
//
//  Created by Osvaldo Mercado on 1/15/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation

import UIKit

protocol PostListBuilderDelegate: class {
    
}

class PostListBuilder: BuilderType {
    
    weak var delegate: PostListBuilderDelegate?
    
    init(delegate: PostListBuilderDelegate) {
        self.delegate = delegate
    }
    
    func build(view: UIViewController) {
        guard let viewController = view as? PostListViewController else {
            return
        }
        
        let interactor = PostListInteractor()
        let router = PostListRouter()
        let presenter = PostListPresenter(interactor: interactor, router: router)
        
        interactor.delegate = presenter
        presenter.delegate = viewController
        router.baseView = viewController
        
        router.baseView = viewController
        viewController.presenter = presenter
    }
}
