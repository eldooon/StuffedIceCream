//
//  ItemDetailController.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 2/6/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class ItemDetailController: UIViewController {
    
    let itemImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .blue
        return iv
    }()
    
    let itemNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Item Name"
        label.font = UIFont.primary
        return label
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
        itemNameLabel.anchor(centerX: view.centerXAnchor, centerY: nil, top: itemImageView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
}
