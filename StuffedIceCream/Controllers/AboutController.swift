//
//  AboutController.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 1/23/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

private let cellId = "cellId"
private let headerId = "headerId"

class AboutController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "About"
        collectionView?.backgroundColor = .white
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(AboutHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    
        // Configure the cell
    
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId, for: indexPath) as! AboutHeaderCell
        
        header.itemImageView.image = #imageLiteral(resourceName: "aboutHeaderImage")
        header.itemTextView.text = "Now that we have your attention, This is a story all about how our ice cream got flipped turned upside down and I'd like to take a minute so scoop on by I'll tell you how we became Stuffed Ice Cream started by two guys.\n\nWith little to no culinary background, besides the occasional cup noodles here and there, owners Jackie and Alan were able to whip up some \"spot on\" flavors along with warm fluffy donuts. We strive for every single flavor to taste true to their name. After months of extensive research and experimentation, the \"Cruff\" was born.\n\nWhat is a Cruff and why that name?\nCRUFF: [kr-uff] noun\n- A perfectly toasted, glazed donut stuffed with your ice cream flavor & toppings of choice.\n\n \"Woah, that Cruff looks almost too good to eat!\"\n\nPlace of origin: Brooklyn, NY\nCombination of (Cr)eam from ice cream + St(uff)ed\n\nStuffed Ice Cream isn't like your typical dessert shop, we believe in work hard, play hard, with both of them going hand in hand at any given time of the day. We like to bring the same comedic energy we hold during our everyday lives to both our customers and staff.\nWithout you, we got nothing to scoop for."
        
        return header
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 670)
    }

}
