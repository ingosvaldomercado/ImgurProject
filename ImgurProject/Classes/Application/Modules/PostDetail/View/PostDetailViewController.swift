//
//  PostDetailViewController.swift
//  ImgurProject
//
//  Created by Osvaldo Mercado on 1/15/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class PostDetailViewController: MainViewController {
    
    @IBOutlet weak var uiCoverView: UIImageView!
    @IBOutlet weak var uiDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension PostDetailViewController: PostDetailPresenterDelegate {
    func didUpdate(viewModel: PostDetailViewModelType) {
        DispatchQueue.main.async { [weak self] in
            guard let wSelf = self else { return }
            wSelf.title = viewModel.title
            wSelf.uiDescription.text = viewModel.description
            
            guard let images = viewModel.image else { return }
            
            let imageFilter = AspectScaledToFillSizeFilter(size: wSelf.uiCoverView.frame.size)
            
            wSelf.uiCoverView.af_setImage(withURL: images, placeholderImage: nil, filter: imageFilter, progress: nil, imageTransition: .noTransition, runImageTransitionIfCached: false) { (data) in
                
            }
        }
    }
}
