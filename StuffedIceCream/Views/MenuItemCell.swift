//
//  MenuItemCell.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 1/26/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class MenuItemCell: UICollectionViewCell {
    
    var menuItem: MenuItem? {
        didSet {
            
            if let name = menuItem?.name {
                itemNameLabel.text = name
            }
            
            if let imageURL = menuItem?.image {
                
                itemImageView.loadImage(urlString: imageURL)
            }
        }
    }
    
    let itemImageView: StuffedImageView = {
        let iv = StuffedImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let itemNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Menu Name"
        label.font = UIFont.commentsBold
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createLayout(){
        
        addSubview(itemImageView)
        itemImageView.anchor(centerX: nil, centerY: nil, top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 140)
        
        addSubview(itemNameLabel)
        itemNameLabel.anchor(centerX: centerXAnchor, centerY: nil, top: itemImageView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 90, height: 50)
    }
    
}
