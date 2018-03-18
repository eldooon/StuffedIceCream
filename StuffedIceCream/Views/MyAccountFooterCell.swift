//
//  MyAccountFooterCell.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 3/18/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class MyAccountFooterCell: UICollectionViewCell {
    
    let noCouponsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.primaryBold
        label.textAlignment = .center
        label.text = "Aw cruff, looks like you currently do not have any coupons"
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
        
        addSubview(noCouponsLabel)
        noCouponsLabel.anchor(centerX: centerXAnchor, centerY: centerYAnchor, top: nil, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 0, paddingRight: 5, width: 0, height: 50)
        
    }
}
