//
//  HomeCategoryCell.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 2/12/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class HomeCategoryCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    let homeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Media"
        label.font = UIFont.titlesSmall
        label.textColor = .white
        return label
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return view
    }()
    
    var mediaItems: [MediaItem]?
    
    var cellSize: CGSize = CGSize(width: 150, height: 150)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        homeCollectionView.dataSource = self
        homeCollectionView.delegate = self
        homeCollectionView.register(HomeItemCell.self, forCellWithReuseIdentifier: cellId)
        homeCollectionView.reloadData()
        createLayout()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createLayout() {
        
        addSubview(nameLabel)
        nameLabel.anchor(centerX: centerXAnchor, centerY: nil, top: topAnchor, left: nil , bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(dividerLineView)
        dividerLineView.anchor(centerX: nil, centerY: nil, top: bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 1)
        
        addSubview(homeCollectionView)
        homeCollectionView.anchor(centerX: nil, centerY: nil, top: nameLabel.bottomAnchor, left: leftAnchor, bottom: dividerLineView.bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let count = mediaItems?.count {
           return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeItemCell
        cell.itemImageView.image = mediaItems?[indexPath.item].mediaImage
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 14, 0, 14)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let link = mediaItems?[indexPath.item].mediaLink {
            
            guard let url = URL(string: link) else {return}
            
            UIApplication.shared.open(url, options: [:], completionHandler: { (status) in
                //
            })
        }
        
    }
}
