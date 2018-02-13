//
//  HomeHeaderCell.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 1/22/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class HomeHeaderCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {

    private let cellId = "cellId"
    
    let headerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
//        collectionView.backgroundColor = .blue
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    let testImages = [#imageLiteral(resourceName: "ForkYeah"),#imageLiteral(resourceName: "NBC"), #imageLiteral(resourceName: "Fox5")]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        headerCollectionView.dataSource = self
        headerCollectionView.delegate = self
        headerCollectionView.register(HomeHeaderItemCell.self, forCellWithReuseIdentifier: cellId)
        
        createLayout()
        startTimer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createLayout() {
    
        addSubview(headerCollectionView)
        headerCollectionView.anchor(centerX: nil, centerY: nil, top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    @objc func scrollToNextCell(){
        
        let cellSize = CGSize(width: frame.width, height: frame.height)
        
        let contentOffset = headerCollectionView.contentOffset
        
        if contentOffset.x > 600.0 {

            headerCollectionView.scrollRectToVisible(CGRect(x: 0, y: contentOffset.y, width: cellSize.width, height: cellSize.height), animated: true)
        } else {
            
            headerCollectionView.scrollRectToVisible(CGRect(x: contentOffset.x + cellSize.width, y: contentOffset.y, width: cellSize.width, height: cellSize.height), animated: true)
        }
        print(contentOffset.x)
        print(contentOffset.y)
        
    }
    
    func startTimer() {
        
        _ = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(scrollToNextCell), userInfo: nil, repeats: true);
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeHeaderItemCell
        cell.itemImageView.image = testImages[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: frame.width, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}
