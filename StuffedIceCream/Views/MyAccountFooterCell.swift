//
//  MyAccountFooterCell.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 3/18/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class MyAccountFooterCell: UICollectionViewCell {
    
    let noCouponsImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "noCoupon")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let noCouponsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.commentsBold
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Aw cruff, looks like you currently do not have any coupons..."
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
        
        addSubview(noCouponsImageView)
        noCouponsImageView.anchor(centerX: centerXAnchor, centerY: centerYAnchor, top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        
        addSubview(noCouponsLabel)
        noCouponsLabel.anchor(centerX: centerXAnchor, centerY: nil, top: noCouponsImageView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: 5, width: 150, height: 50)
        
    }
}
