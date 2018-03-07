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
    
    let menuItems = MenuItems()
    
    var homeController: HomeController?
    
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
            menuCollectionView.frame = CGRect(x: -window.frame.width, y: 0, width: 200, height:window.frame.height)
            
            UIView.animate(withDuration: 0.5, animations: {
                self.darkenView.alpha = 1
                self.menuCollectionView.frame = CGRect(x: 0, y: 0 , width: 200, height: self.menuCollectionView.frame.height)
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
    
    func presentController(ItemSelected: String) {

        homeController?.didSelectMenuItem(Item: ItemSelected)

       dismissLauncher()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return menuItems.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! SideMenuCell
        
        cell.menuImageView.image = menuItems.items[indexPath.item].menuImage
        cell.menuNameLabel.text = menuItems.items[indexPath.item].menuName
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events)
        
        switch indexPath.item {
        case 0:
            presentController(ItemSelected: "My Account")
        case 1:
            presentController(ItemSelected: "About")
        case 2:
            presentController(ItemSelected: "Location")
        case 3:
            presentController(ItemSelected: "Menu")
        case 4:
            presentController(ItemSelected: "Catering")
            
        default:
            return
        }
    }
    
    
    func setUpMenuCollectionCells() {
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        //setup Layout
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = UICollectionViewScrollDirection.vertical
        layout.itemSize = CGSize(width: 200, height: screenWidth/5)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        
        menuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
        menuCollectionView.register(SideMenuCell.self, forCellWithReuseIdentifier: cellId)
        menuCollectionView.showsVerticalScrollIndicator = false
        menuCollectionView.showsHorizontalScrollIndicator = false
        menuCollectionView.contentInset = UIEdgeInsets(top: 50, left: 30, bottom: 0, right: 0)
        menuCollectionView.backgroundColor = .stuffedBlue
        
    }
    
}
