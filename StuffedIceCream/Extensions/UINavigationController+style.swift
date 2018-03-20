//
//  UINavigationController+style.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 3/20/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    func popViewController(animated: Bool, completion: @escaping () -> ()) {
        popViewController(animated: animated)
        
        if let coordinator = transitionCoordinator, animated {
            coordinator.animate(alongsideTransition: nil) { _ in
                completion()
            }
        } else {
            completion()
        }
    }
}
