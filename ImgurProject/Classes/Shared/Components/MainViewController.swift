//
//  MainViewController.swift
//  ImgurProject
//
//  Created by Osvaldo Mercado on 1/11/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController, ViewType {
    var presenter: PresenterType?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: View life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewWillBecomeActive()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        presenter?.viewDidBecomeInactive()
    }
}
