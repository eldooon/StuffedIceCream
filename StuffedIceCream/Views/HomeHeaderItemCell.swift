//
//  HomeHeaderItemCell.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 1/22/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class HomeHeaderItemCell: UICollectionViewCell {
    
    let itemImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .white
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    var headerItem: HeaderItem? {
        didSet {
            
            if let imageURL = headerItem?.image {
                
                guard let url = URL(string: imageURL) else { return }
                
                URLSession.shared.dataTask(with: url, completionHandler: { (data, response, err) in
                    if let err = err {
                        print("Failed to convert this image due to", err)
                    }
                    
                    guard let imageData = data else { return }
                    let image = UIImage(data: imageData)
                    
                    DispatchQueue.main.async {
                        self.itemImageView.image = image
                    }
                    
                }).resume()
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
