//
//  UIViewController+style.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 2/6/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func hideKeyboardWhenTapped() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
