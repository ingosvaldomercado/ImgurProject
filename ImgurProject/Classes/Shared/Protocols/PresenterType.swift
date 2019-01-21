//
//  PresenterType.swift
//  ImgurProject
//
//  Created by Osvaldo Mercado on 1/18/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation

protocol PresenterType: class {
    func viewWillBecomeActive()
    func viewDidBecomeInactive()
}
