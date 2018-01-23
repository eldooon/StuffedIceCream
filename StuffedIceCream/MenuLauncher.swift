//
//  MenuLauncher.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 1/23/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//


import UIKit

class MoreMenuLauncher : NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var darkenView = UIView()
    var menuCollectionView : UICollectionView = {
        let layout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        return collectionView
    }()
    
    private let cellId = "cellId"
    
    override init() {
        super.init()
        
        setUpMenuCollectionCells()
    }
    
    func showMenu() {
        
    
        if let window = UIApplication.shared.keyWindow {

            window.addSubview(darkenView)
            darkenView.backgroundColor = UIColor(white: 0, alpha: 0.1)
            darkenView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissLauncher)))
            darkenView.frame = window.frame
            darkenView.alpha = 0
            
            window.addSubview(menuCollectionView)
            let width : CGFloat = 400
            let x =  width - window.frame.width
            menuCollectionView.frame = CGRect(x: -window.frame.width, y: 0 , width: window.frame.width, height:window.frame.height)
            
            UIView.animate(withDuration: 0.5, animations: {
                self.darkenView.alpha = 1
                self.menuCollectionView.frame = CGRect(x: x, y: 0 , width: window.frame.width/2, height: self.menuCollectionView.frame.height)
            })
        }
        
    }
    
    @objc func dismissLauncher() {
        
        UIView.animate(withDuration: 0.5) {
            
            if let window = UIApplication.shared.keyWindow {
                self.darkenView.alpha = 0
                self.menuCollectionView.frame = CGRect(x: -window.frame.width, y: 0 , width: window.frame.width, height:window.frame.height)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        
    }
    
    
    func setUpMenuCollectionCells() {
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        //setup Layout
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = UICollectionViewScrollDirection.vertical
        layout.itemSize = CGSize(width: screenWidth/2.005, height: screenWidth/5)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 0
        
        menuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
        menuCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        menuCollectionView.showsVerticalScrollIndicator = false
        menuCollectionView.showsHorizontalScrollIndicator = false
        menuCollectionView.contentInset = UIEdgeInsets(top: 100, left: 10, bottom: 0, right: 0)
        menuCollectionView.backgroundColor = .stuffedBlue
        
    }
    
}
