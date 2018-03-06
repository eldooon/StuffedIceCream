//
//  HomeHeaderItemCell.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 1/22/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class HomeHeaderItemCell: UICollectionViewCell {
    
    let itemImageView: StuffedImageView = {
        let iv = StuffedImageView()
        iv.backgroundColor = .white
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    var headerItem: HeaderItem? {
        didSet {

            if let imageURL = headerItem?.image {
                itemImageView.loadImage(urlString: imageURL)
            }
        }
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createLayout() {
        
        addSubview(itemImageView)
        itemImageView.anchor(centerX: nil, centerY: nil, top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
}
