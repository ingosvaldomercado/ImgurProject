//
//  PostDetailPresenterTests.swift
//  ImgurProjectTests
//
//  Created by Osvaldo Mercado on 1/18/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
import XCTest
@testable import ImgurProject

class PostDetailPresenterTests: XCTestCase {
    
    var sut: PostDetailPresenter?
    let interactor = PostDetailInteractorMock()
    let router = PostDetailRouterMock()
    let mockDelegate = PostDetailPresenterDelegateMock()
    
    override func setUp() {
        sut = PostDetailPresenter(interactor: interactor, router: router)
    }
    
    func test_DidTapClose_GivenPresenter_ShouldCloseView() {
        // When
        sut?.didTapClose()
        
        // Then
        wait(for: [router.expectation], timeout: 1.0)
    }
    
    func test_ViewWillBecomeActive_GivenViewModel_ShouldShowDetailView() {
        // Given
        sut?.delegate = mockDelegate
        sut?.viewModel = PostDetailViewModelMock()
        
        // When
        sut?.viewWillBecomeActive()
        
        // Then
        wait(for: [mockDelegate.expectation], timeout: 1.0)
    }
}
