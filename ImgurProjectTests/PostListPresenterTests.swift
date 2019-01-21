//
//  PostListPresenterTests.swift
//  ImgurProjectTests
//
//  Created by Osvaldo Mercado on 1/18/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import XCTest
@testable import ImgurProject

class PostListPresenterTests: XCTestCase {
    
    let expectationTimeout = 1.0
    var sut: PostListPresenter?
    let interactorMock = PostListInteractorMock()
    let routerMock = PostListRouterMock()
    let mockDelegate = PostListPresenterDelegateMock()

    override func setUp() {
        sut = PostListPresenter(interactor: interactorMock, router: routerMock)
    }

    func test_StartFetchingMock_GivenPresenter_ShouldFetchPost() {
        // Given
        interactorMock.delegate = sut
        sut?.delegate = mockDelegate
        
        // When
        sut?.startFetchingPost(query: "query", page: "1")
        
        // Then
        wait(for: [mockDelegate.expectation], timeout: 1.0)
    }

    func test_StartFetchingMock_GivenPresenter_ShouldShowError() {
        // Given
        interactorMock.delegate = sut
        sut?.delegate = mockDelegate
        
        // When
        sut?.startFetchingPost(query: "error", page: "1")
        
        // Then
        wait(for: [mockDelegate.expectation], timeout: 1.0)
    }
    
    func test_DidTapListItemViewModel_GivenIndexAndSegue_ShouldOpenRoute() {
        // Given
        let segue = UIStoryboardSegue(identifier: "id", source: UIViewController(), destination: UIViewController())
        interactorMock.delegate = sut
        
        // When
        sut?.resetListItems()
        sut?.startFetchingPost(query: "query", page: "1")
        sut?.didTapListItemViewModel(at: 0, segue: segue)
        
        // Then
        wait(for: [routerMock.expectation], timeout: 1.0)
    }
    
    func test_ModelAtIndex_GivenIndex_ReturnValidModel() {
        // Given
        let index = 0
        let mockTitle = "title"
        interactorMock.delegate = sut
        
        guard let mockURL = URL(string: "http://url.com") else {
            return XCTFail("URL string could not be parsed")
        }
        
        // When
        sut?.resetListItems()
        sut?.startFetchingPost(query: "query", page: "1")
        
        guard let model = sut?.model(at: index) else {
            return XCTFail("Model not found at index \(index)")
        }
        
        guard
            let postModel = model.postModel
        else {
            return XCTFail("Retrive post model fails")
        }
        
        // Then
        XCTAssertEqual(model.title, mockTitle, "Model title should be equal to \(mockTitle)")
        XCTAssertEqual(postModel.coverImage, mockURL, "Model url should be equal to \(mockURL)")
    }
}
