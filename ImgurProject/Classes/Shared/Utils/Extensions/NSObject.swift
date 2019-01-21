//
//  NSObject.swift
//  ImgurProject
//
//  Created by Osvaldo Mercado on 1/15/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
import UIKit

extension NSObject {
    
    func debounce(_ action: Selector, delay: TimeInterval, controller: UIViewController) {
        weak var weakSelf = controller
        NSObject.cancelPreviousPerformRequests(withTarget: weakSelf!, selector: action, object: nil)
        weakSelf?.perform(action, with: nil, afterDelay: delay)
    }
}
