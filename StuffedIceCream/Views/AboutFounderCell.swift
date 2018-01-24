//
//  AboutFounderCell.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 1/24/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class AboutFounderCell: UICollectionViewCell {
    
    let founderImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .blue
        return iv
    }()
    
    let founderNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Founder Name"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createLayout() {
        
        addSubview(founderImageView)
        founderImageView.anchor(centerX: nil, centerY: nil, top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        
        addSubview(founderNameLabel)
        founderNameLabel.anchor(centerX: nil, centerY: nil, top: founderImageView.topAnchor, left: founderImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
    }
}
