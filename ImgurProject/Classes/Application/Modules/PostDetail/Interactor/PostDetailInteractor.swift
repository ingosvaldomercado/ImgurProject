//
//  PostDetailInteractor.swift
//  ImgurProject
//
//  Created by Osvaldo Mercado on 1/15/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation

protocol PostDetailInteractorType: InteractorType {
}

protocol PostDetailInteractorDelegate: class {
}

class PostDetailInteractor: PostDetailInteractorType {
    weak var delegate: PostDetailInteractorDelegate?
}
