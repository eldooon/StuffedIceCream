//
//  UIViewController+navFunctions.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 1/23/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func customAppearance() {
        self.navigationItem.title = "Stuffed"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu"), style: .plain, target: self, action: #selector(menuButtonTapped))
    }
    
    @objc func menuButtonTapped() {
        let menuLauncher = MoreMenuLauncher()
        menuLauncher.showMenu()
    }
}

