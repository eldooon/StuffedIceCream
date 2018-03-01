//
//  ItemDetailController.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 2/6/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class ItemDetailController: UIViewController {
    
    var menuItem: MenuItem? {
        didSet {
            
            if let name = menuItem?.name {
                itemNameLabel.text = name
            }
            
            if let description = menuItem?.description {
                itemDescriptionTextView.text = description
            }
            
            if let imageURL = menuItem?.image {
                
                ImageConversion.convertStringToImage(imageURL: imageURL, imageView: itemImageView)
            }
        }
    }
    
    var scrollView : UIScrollView = {
        let sv = UIScrollView()
//        sv.isUserInteractionEnabled = true
        sv.isScrollEnabled = true
        return sv
    }()
    
    let itemImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    let itemNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Item Name"
        label.font = UIFont.titlesSmall
        return label
    }()
    
    let itemDescriptionTextView: UITextView = {
        let tv = UITextView()
        tv.font = UIFont.commentsBold
        tv.text = "Item Description"
        tv.isUserInteractionEnabled = false
        tv.textAlignment = .center
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        createLayout()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func createLayout() {
        
        view.addSubview(scrollView)
        scrollView.anchor(centerX: nil, centerY: nil, top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        scrollView.addSubview(itemImageView)
        itemImageView.anchor(centerX: nil, centerY: nil, top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 200)
        
        scrollView.addSubview(itemNameLabel)
        itemNameLabel.anchor(centerX: scrollView.centerXAnchor, centerY: nil, top: itemImageView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        scrollView.addSubview(itemDescriptionTextView)
        itemDescriptionTextView.anchor(centerX: nil, centerY: nil, top: itemNameLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 420)
    }
    
    override func viewWillLayoutSubviews() {

        if itemNameLabel.text == "Jackie Luu" {
            scrollView.contentSize.height = 700
        }
    }
}
