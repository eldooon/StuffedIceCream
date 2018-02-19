//
//  StuffedTextField.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 1/30/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit
import TextFieldEffects

class StuffedTextField: HoshiTextField {

    let errorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.commentsBold
        label.textColor = .red
        label.text = "ERROR ERROR"
        return label
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        createLayout()
        
        addSubview(errorLabel)
        errorLabel.anchor(centerX: nil, centerY: nil, top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createLayout() {
        
        self.placeholderColor = .darkGray
        self.borderInactiveColor = .lightGray
        self.borderActiveColor = .stuffedBlue
        
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y + 5, width: bounds.width, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y + 5, width: bounds.width, height: bounds.height)
    }

}


