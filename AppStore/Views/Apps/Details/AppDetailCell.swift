//
//  AppDetailCell.swift
//  AppStore
//
//  Created by Rishabh Raj on 27/06/19.
//  Copyright © 2019 Rishabh Raj. All rights reserved.
//

import UIKit

class AppDetailCell : UICollectionViewCell {
    
    var app : Result! {
        didSet {
            nameLabel.text = app?.trackName
            releaseNotesLabel.text = app?.releaseNotes
            appIconImageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
            priceButton.setTitle(app?.formattedPrice, for: .normal)
        }
    }
    
    let appIconImageView = UIImageView(cornerRadius: 16)
    
    let nameLabel = UILabel(text: "App Name", font: .boldSystemFont(ofSize: 24), numberOfLines: 2)
    
    let priceButton = UIButton(title: "$4.99")
    
    let whatsNewLabel = UILabel(text: "Whats New", font: .boldSystemFont(ofSize: 20))
    
    let releaseNotesLabel = UILabel(text: "Release Notes", font: .systemFont(ofSize: 16), numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        backgroundColor = .lightGray
        
        appIconImageView.constrainWidth(constant: 140)
        appIconImageView.constrainHeight(constant: 140)
        priceButton.backgroundColor = #colorLiteral(red: 0.2227783501, green: 0.4739406109, blue: 0.9661183953, alpha: 1)
        priceButton.setTitleColor(.white, for: .normal)
        priceButton.constrainHeight(constant: 32)
        priceButton.layer.cornerRadius = 32 / 2
        priceButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        priceButton.constrainWidth(constant: 80)
        
        appIconImageView.backgroundColor = .red
       let stackView = VerticalStackView(arrangedSubviews: [
        UIStackView(arrangedSubviews: [
            appIconImageView,
            VerticalStackView(arrangedSubviews: [
                nameLabel, UIStackView(arrangedSubviews: [priceButton, UIView()]),UIView()], spacing: 12)],customSpacing: 20),
        whatsNewLabel,releaseNotesLabel
        ], spacing: 16)
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
