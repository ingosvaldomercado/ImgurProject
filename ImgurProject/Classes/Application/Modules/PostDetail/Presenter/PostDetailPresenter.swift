//
//  PostDetailPresenter.swift
//  ImgurProject
//
//  Created by Osvaldo Mercado on 1/14/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation

protocol PostDetailPresenterDelegate: class {
    func didUpdate(viewModel: PostDetailViewModelType)
}

protocol PostDetailPresenterType: PresenterType {
    var viewModel: PostDetailViewModelType? { get set }
    func didTapClose()
}

class PostDetailPresenter: PostDetailPresenterType {
    let interactor: PostDetailInteractorType
    let router: PostDetailRouterType
    weak var delegate: PostDetailPresenterDelegate?
    var viewModel: PostDetailViewModelType?
    
    init(interactor: PostDetailInteractorType,
         router: PostDetailRouterType) {
        self.interactor = interactor
        self.router = router
    }
    
    func didTapClose() {
        router.close()
    }
    
    func viewWillBecomeActive() {
        guard let viewModel = self.viewModel else { return }
        delegate?.didUpdate(viewModel: viewModel)
    }
    
    func viewDidBecomeInactive() {
        
    }
}

extension PostDetailPresenter: PostDetailInteractorDelegate {
    
}
