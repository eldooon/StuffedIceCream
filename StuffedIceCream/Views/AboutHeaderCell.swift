//
//  AboutHeaderCell.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 1/24/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class AboutHeaderCell: UICollectionViewCell {
    
    let itemImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.sizeToFit()
        iv.image = #imageLiteral(resourceName: "aboutHeaderImage")
        return iv
    }()
    
    let itemTextView: UITextView = {
        let tv = UITextView()
        tv.isScrollEnabled = false
        tv.font = UIFont.comments
        tv.isUserInteractionEnabled = false
        tv.text = "Now that we have your attention, This is a story all about how our ice cream got flipped turned upside down and I'd like to take a minute so scoop on by I'll tell you how we became Stuffed Ice Cream started by two guys.\n\nWith little to no culinary background, besides the occasional cup noodles here and there, owners Jackie and Alan were able to whip up some \"spot on\" flavors along with warm fluffy donuts. We strive for every single flavor to taste true to their name. After months of extensive research and experimentation, the \"Cruff\" was born.\n\nWhat is a Cruff and why that name?\nCRUFF: [kr-uff] noun\n- A perfectly toasted, glazed donut stuffed with your ice cream flavor & toppings of choice.\n\n \"Woah, that Cruff looks almost too good to eat!\"\n\nPlace of origin: Brooklyn, NY\nCombination of (Cr)eam from ice cream + St(uff)ed\n\nStuffed Ice Cream isn't like your typical dessert shop, we believe in work hard, play hard, with both of them going hand in hand at any given time of the day. We like to bring the same comedic energy we hold during our everyday lives to both our customers and staff.\nWithout you, we got nothing to scoop for."
        return tv
    }()
    
    let dividerLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.1)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createLayout() {
        
        addSubview(itemImageView)
        itemImageView.anchor(centerX: nil, centerY: nil, top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 20, paddingRight: 20, width: 0, height: 200)
        
        addSubview(itemTextView)
        itemTextView.anchor(centerX: nil, centerY: nil, top: itemImageView.bottomAnchor, left: leftAnchor, bottom: nil  , right: rightAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 400)
        
        addSubview(dividerLine)
        dividerLine.anchor(centerX: nil, centerY: nil, top: itemTextView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 1)
    }
    
}
