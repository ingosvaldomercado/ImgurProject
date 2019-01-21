//
//  PostDetailBuilder.swift
//  ImgurProject
//
//  Created by Osvaldo Mercado on 1/14/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
import UIKit

protocol PostDetailBuilderDelegate: class {
    func didCloseDetailsModule()
}

class PostDetailBuilder: BuilderType {
    
    weak var delegate: PostDetailBuilderDelegate?
    
    let model: PostModelType
    
    init(model: PostModelType,
         delegate: PostDetailBuilderDelegate) {
        self.model = model
        self.delegate = delegate
    }
    
    func build(view: UIViewController) {
        guard let viewController = view as? PostDetailViewController else {
            return
        }
        
        let interactor = PostDetailInteractor()
        let router = PostDetailRouter()
        let presenter = PostDetailPresenter(interactor: interactor, router: router)
        
        interactor.delegate = presenter
        router.baseView = viewController
        router.delegate = self
        presenter.delegate = viewController
        
        guard let coverImage = self.model.coverImage else { return }
        
        presenter.viewModel = PostDetailViewModel.init(title: self.model.title, description: self.model.topic, image: coverImage)
        
        viewController.presenter = presenter
    }
}

extension PostDetailBuilder: PostDetailRouterDelegate {
    func didClosePostDetails() {
        delegate?.didCloseDetailsModule()
    }
}
