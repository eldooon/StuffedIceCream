//
//  MenuController.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 1/25/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

protocol MenuControllerDelegate {
   func didFetchData()
}

class MenuController: UICollectionViewController, UICollectionViewDelegateFlowLayout, MenuControllerDelegate {
    
    func didFetchData() {
        collectionView?.reloadData()
    }
    
    private let cellId = "cellId"
    let database = FireBaseData.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "MENU"
        collectionView?.backgroundColor = .white
        collectionView?.register(MenuCategoryCell.self, forCellWithReuseIdentifier: cellId)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        
        if database.menuDatabase.count == 0 {
            return 1
        }
        return database.menuDatabase.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCategoryCell
    
        if database.menuDatabase.count != 0 {
            cell.nameLabel.text = database.menuDatabase[indexPath.item].name
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 200)
    }

}
