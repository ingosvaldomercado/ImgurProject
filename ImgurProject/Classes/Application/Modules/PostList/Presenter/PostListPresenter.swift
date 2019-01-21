//
//  PostListPresenter.swift
//  ImgurProject
//
//  Created by Osvaldo Mercado on 1/11/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
import UIKit

protocol PostListPresenterDelegate: class  {
    func displayFetchedPosts(viewModels: [PostListItemViewModelType])
    func showError()
}

protocol PostListPresenterType: PresenterType {
    var interactor: PostListInteractorType { get set }
    var router: PostListRouterType { get set }
    
    func startFetchingPost(query: String, page: String)
    func resetListItems()
    func numberOfListItems() -> Int
    func model(at index: Int) -> PostListItemViewModelType?
    func didTapListItemViewModel(at index: Int, segue: UIStoryboardSegue)
}

class PostListPresenter: PostListPresenterType
{
    var interactor: PostListInteractorType
    var router: PostListRouterType
    weak var delegate: PostListPresenterDelegate?
    
    fileprivate var models: [PostListItemViewModelType]?
    
    init(interactor: PostListInteractorType, router: PostListRouterType) {
        self.interactor = interactor
        self.router = router
    }
 
    func startFetchingPost(query: String, page: String) {
        interactor.fetchPosts(query: query, page: page)
    }
    
    func resetListItems() {
        self.models = []
    }
    
    func numberOfListItems() -> Int {
        guard let models = self.models else { return 0}
        return models.count
    }
    
    func model(at index: Int) -> PostListItemViewModelType? {
        guard let models = self.models, index < numberOfListItems() else { return nil }
        return models[index]
    }
    
    func didTapListItemViewModel(at index: Int, segue: UIStoryboardSegue) {
        guard let models = self.models, index < numberOfListItems() else { return }
        let model = models[index]
        guard let postModel = model.postModel else { return }
        router.open(model: postModel, segue: segue)
    }
    
    func viewWillBecomeActive() {
        
    }
    
    func viewDidBecomeInactive() {
        
    }
}

extension PostListPresenter: PostListInteractorDelegate
{
    func noticeFetchedSuccess(posts: [PostModelType]) {
        var viewModels: [PostListItemViewModelType] = []
        
        for post in posts {
            
            guard let coverImage = post.coverImage else { continue }
            
            let itemViewModel = PostListItemViewModel(title: post.title, image: coverImage, postModel: post)
            viewModels.append(itemViewModel)
        }
        
        self.models?.append(contentsOf: viewModels)
        
        delegate?.displayFetchedPosts(viewModels: self.models ?? [])
    }
    
    func noticeFetchFailed() {
        delegate?.showError()
    }
}
