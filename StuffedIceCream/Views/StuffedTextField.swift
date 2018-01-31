//
//  StuffedTextField.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 1/30/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class StuffedTextField: UITextField {

    override init(frame: CGRect){
        super.init(frame: frame)
        createLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createLayout() {
        
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.stuffedBlue.cgColor
        self.layer.borderWidth = 2
        
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width, height: bounds.height)
    }

}


