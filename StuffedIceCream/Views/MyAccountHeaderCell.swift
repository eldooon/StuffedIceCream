//
//  MyAccountHeaderCell.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 3/14/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class MyAccountHeaderCell: UICollectionViewCell {
    
    let logoImageView: StuffedImageView = {
        let iv = StuffedImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = #imageLiteral(resourceName: "logo")
        return iv
    }()
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.primaryBold
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
        
        addSubview(logoImageView)
        logoImageView.anchor(centerX: nil, centerY: nil, top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 100)
        
        addSubview(welcomeLabel)
        welcomeLabel.anchor(centerX: centerXAnchor, centerY: nil, top: logoImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: 5, width: 0, height: 30)
    }
}
