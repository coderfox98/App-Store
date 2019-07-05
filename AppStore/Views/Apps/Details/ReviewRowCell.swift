//
//  ReviewRowCell.swift
//  AppStore
//
//  Created by Rishabh Raj on 01/07/19.
//  Copyright © 2019 Rishabh Raj. All rights reserved.
//

import UIKit

class ReviewRowCell : UICollectionViewCell {
    
    let reviewsController = ReviewsController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .yellow
        
        addSubview(reviewsController.view)
        reviewsController.view.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
