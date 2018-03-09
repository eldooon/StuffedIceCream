//
//  StuffedButton.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 3/9/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class StuffedButton: UIButton {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 6, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }


}
