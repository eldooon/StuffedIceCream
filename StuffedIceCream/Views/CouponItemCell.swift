//
//  CouponItemCell.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 3/7/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class CouponItemCell: UICollectionViewCell {
    
    var coupon: Coupon? {
        didSet{
            if let name = coupon?.name {
                couponNameLabel.text = name
            }
            
            if let imageUrl = coupon?.image {
                couponImageView.loadImage(urlString: imageUrl)
            }
        }
    }
    let couponImageView: StuffedImageView = {
        let iv = StuffedImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let couponNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Coupon Name Coupon Name Coupon Name Coupon Name"
        label.font = UIFont.commentsBold
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        label.backgroundColor = .stuffedBlue
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
        couponImageView.anchor(centerX: nil, centerY: nil, top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 180)
        
        addSubview(couponNameLabel)
        couponNameLabel.anchor(centerX: centerXAnchor, centerY: nil, top: couponImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: 5, width: 0, height: 40)
    }
    
}
