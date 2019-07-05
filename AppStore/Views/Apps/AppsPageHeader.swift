//
//  AppsPageHeader.swift
//  AppStore
//
//  Created by Rishabh Raj on 25/06/19.
//  Copyright © 2019 Rishabh Raj. All rights reserved.
//

import UIKit

class AppsPageHeader : UICollectionReusableView {
    
    let appHeaderHorizontalController = AppsHeaderHorizontalController()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(appHeaderHorizontalController.view)
        appHeaderHorizontalController.view.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
