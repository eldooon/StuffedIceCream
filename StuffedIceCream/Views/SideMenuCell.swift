//
//  MenuCell.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 1/23/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class SideMenuCell: UICollectionViewCell {
    
    let menuImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let menuNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Menu Item"
        label.font = UIFont.primary
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
        
        addSubview(menuImageView)
        menuImageView.anchor(centerX: nil, centerY: centerYAnchor, top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
        
        addSubview(menuNameLabel)
        menuNameLabel.anchor(centerX: nil, centerY: nil, top: menuImageView.topAnchor, left: menuImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
}
