//
//  MenuItemCell.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 1/26/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class MenuItemCell: UICollectionViewCell {
    
    let itemImageView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFit
    return iv
    }()
    
    let itemNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Menu Item"
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
        itemImageView.anchor(centerX: nil, centerY: centerYAnchor, top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 180)
        
        addSubview(itemNameLabel)
        itemNameLabel.anchor(centerX: nil, centerY: nil, top: itemImageView.topAnchor, left: itemImageView.leftAnchor, bottom: nil, right: itemImageView.rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 0, height: 15)
    }
    
}
