//
//  CouponItemCell.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 3/7/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class CouponItemCell: UICollectionViewCell {
    
    let couponImageView: StuffedImageView = {
        let iv = StuffedImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let couponNameLabel: UILabel = {
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
        
        addSubview(couponImageView)
        couponImageView.anchor(centerX: nil, centerY: nil, top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 140)
        
        addSubview(couponNameLabel)
        couponNameLabel.anchor(centerX: centerXAnchor, centerY: nil, top: couponNameLabel.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 90, height: 50)
    }
    
}
