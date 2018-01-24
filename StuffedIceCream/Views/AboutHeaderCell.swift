//
//  AboutHeaderCell.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 1/24/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class AboutHeaderCell: UICollectionViewCell {
    
    let itemImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.sizeToFit()
        return iv
    }()
    
    let itemTextView: UITextView = {
        let tv = UITextView()
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createLayout() {
        
        addSubview(itemImageView)
        itemImageView.anchor(centerX: nil, centerY: nil, top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 20, paddingRight: 20, width: 0, height: 200)
        
        addSubview(itemTextView)
        itemTextView.anchor(centerX: nil, centerY: nil, top: itemImageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 20, paddingLeft: 10, paddingBottom: 20, paddingRight: 10, width: 0, height: 0)
    }
    
}
