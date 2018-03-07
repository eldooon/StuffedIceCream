//
//  ViewController.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 1/22/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    private let headerId = "HeaderId"
    let menuLauncher = MoreMenuLauncher()
    
    let database = FireBaseData.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.]
        
        let logo = UIImageView(image: #imageLiteral(resourceName: "logo"))
        logo.contentMode = .scaleAspectFit
        logo.clipsToBounds = true
        navigationItem.titleView = logo
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu"), style: .plain, target: self, action: #selector(menuButtonTapped))
        
        collectionView?.backgroundColor = .stuffedBlue
        collectionView?.register(HomeCategoryCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(HomeHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        
        database.fetchMenuData {
            print("RETRIEVED DATA")
        }
        
        database.fetchHeaderImages { 
            self.collectionView?.reloadData()
        }
    }

    @objc func menuButtonTapped() {
        menuLauncher.showMenu()
        menuLauncher.homeController = self
    }
    
    func didSelectMenuItem(Item: String) {
        
        var vc: UIViewController
        
        switch Item {
        case "My Account":
            vc = MyAccountController(collectionViewLayout: UICollectionViewFlowLayout())
        case "About":
            vc = AboutController(collectionViewLayout: UICollectionViewFlowLayout())
        case "Location":
            vc = LocationController()
        case "Menu":
            vc = MenuController(collectionViewLayout: UICollectionViewFlowLayout())
        case "Catering":
            vc = CateringController()
        default:
            return
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeCategoryCell
        let mediaItems = MediaItems()
        
        if indexPath.item == 1 {
            cell.nameLabel.text = "Social Media"
            cell.mediaItems =  mediaItems.socialItems
            cell.cellSize = CGSize(width: (view.frame.width/2) - 20, height: 100)
        } else {
            cell.nameLabel.text = "Media"
            cell.mediaItems =  mediaItems.items
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 200)
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId, for: indexPath) as! HomeHeaderCell
        header.headerImages = database.frontpageDatabase
        
        return header
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 300)
    }

}

