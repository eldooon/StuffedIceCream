//
//  MyAccountHeaderCell.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 3/14/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class MyAccountHeaderCell: UICollectionViewCell {
    
    var user: User? {
        didSet {
            if let name = user?.name {
                welcomeLabel.text = "Welcome back \(name)!"
                logInButton.isHidden = true
                welcomeLabel.isHidden = false
            } else  {
                logInButton.isHidden = false
                welcomeLabel.isHidden = true
            }
        }
    }
    
    let logoImageView: StuffedImageView = {
        let iv = StuffedImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = #imageLiteral(resourceName: "logo")
        return iv
    }()
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.primaryBold
        label.textAlignment = .center
        return label
    }()
    
    
    let logInButton: StuffedButton = {
        let button = StuffedButton()
        let stringAttributes : [NSAttributedStringKey: Any] = [
            NSAttributedStringKey.font : UIFont.primaryBold ?? .systemFont(ofSize: 12),
            NSAttributedStringKey.foregroundColor : UIColor.gray,
            NSAttributedStringKey.underlineStyle : NSUnderlineStyle.styleSingle.rawValue]
        let title = NSMutableAttributedString(string: "Click Here to Log In.", attributes: stringAttributes)
        button.setAttributedTitle(title, for: .normal)
        return button
    }()
    
    var myAccountVC = MyAccountController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        logInButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        createLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func logInButtonTapped() {
        print("CLICK CLICK CLICK")
        myAccountVC.checkIfLoggedIn()
    }
    
    private func createLayout(){
        
        addSubview(logoImageView)
        logoImageView.anchor(centerX: nil, centerY: centerYAnchor, top: nil, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 100)
        
        addSubview(welcomeLabel)
        welcomeLabel.anchor(centerX: centerXAnchor, centerY: nil, top: logoImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: 5, width: 0, height: 30)
        
        addSubview(logInButton)
        logInButton.anchor(centerX: centerXAnchor, centerY: nil, top: logoImageView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200, height: 50)
    }
}
