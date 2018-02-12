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
        
        view.addSubview(itemImageView)
        itemImageView.anchor(centerX: nil, centerY: nil, top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 200)
        
        view.addSubview(itemNameLabel)
        itemNameLabel.anchor(centerX: view.centerXAnchor, centerY: nil, top: itemImageView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(itemDescriptionTextView)
        itemDescriptionTextView.anchor(centerX: nil, centerY: nil, top: itemNameLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 400)
    }
}
