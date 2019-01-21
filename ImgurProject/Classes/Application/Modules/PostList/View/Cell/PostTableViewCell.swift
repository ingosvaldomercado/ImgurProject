//
//  PostTableViewCell.swift
//  ImgurProject
//
//  Created by Osvaldo Mercado on 1/11/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit
import AlamofireImage

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var title: UILabel!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        posterImage.image = nil
    }
    
    func setup(withViewModel viewModel: PostListItemViewModelType) {
        self.title.text = viewModel.title
        let placeholderImage = UIImage(named: "Placeholder")!
        guard let image = viewModel.image else { return }
        
        let imageFilter = AspectScaledToFillSizeFilter(size: posterImage.frame.size)
        
        self.posterImage.af_setImage(withURL: image, placeholderImage: placeholderImage, filter: imageFilter, progress: nil, imageTransition: .noTransition, runImageTransitionIfCached: false) { (data) in
            
        }
    }
}
