//
//  VerticalStackView.swift
//  AppStore
//
//  Created by Rishabh Raj on 24/06/19.
//  Copyright © 2019 Rishabh Raj. All rights reserved.
//

import UIKit

class VerticalStackView : UIStackView {
    
    init(arrangedSubviews : [UIView], spacing : CGFloat = 0) {
        super.init(frame: .zero)
        self.axis = .vertical
        self.spacing = spacing
        arrangedSubviews.forEach({addArrangedSubview($0)})
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
