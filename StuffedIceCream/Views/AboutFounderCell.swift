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
        iv.sizeToFit()
        iv.contentMode = .scaleAspectFill
        iv.layer.borderWidth = 2
        iv.layer.masksToBounds = false
        iv.layer.borderColor = UIColor.stuffedBlue.cgColor
        iv.layer.cornerRadius = 100/2
        iv.clipsToBounds = true
        return iv
    }()
    
    let founderLabel: UILabel = {
        let label = UILabel()
        label.text = "Co-Founder"
        return label
    }()
    
    let founderNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Founder Name"
        return label
    }()
    
    let readAboutLabel: UILabel = {
        let label = UILabel()
        label.text = "Click to read more..."
        label.font = label.font.withSize(10)
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
        founderImageView.anchor(centerX: nil, centerY: nil, top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        
        addSubview(founderLabel)
        founderLabel.anchor(centerX: nil, centerY: nil, top: nil, left: founderImageView.rightAnchor, bottom: centerYAnchor, right: nil, paddingTop: 0, paddingLeft: 50, paddingBottom: 10, paddingRight: 0, width: 0, height: 0)
        
        addSubview(founderNameLabel)
        founderNameLabel.anchor(centerX: nil, centerY: nil, top: founderLabel.bottomAnchor, left: founderLabel.leftAnchor, bottom: nil, right: nil, paddingTop: 2, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(readAboutLabel)
        readAboutLabel.anchor(centerX: nil, centerY: nil, top: nil, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 10, paddingRight: 10, width: 0, height: 0)
        
    }
}
