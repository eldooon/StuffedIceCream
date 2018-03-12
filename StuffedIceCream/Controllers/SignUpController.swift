//
//  SignUpController.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 3/8/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit
import SwiftValidator

class SignUpController: UIViewController, UITextFieldDelegate, ValidationDelegate {
    
    let cancelButton: StuffedButton = {
        let button = StuffedButton()
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = UIFont.primaryBold
        button.setTitleColor(.stuffedBlue, for: .normal)
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let emailTextfield: StuffedTextField = {
        let tf = StuffedTextField()
        tf.placeholder = "Email Address"
        return tf
    }()
    
    let passwordTextfield: StuffedTextField = {
        let tf = StuffedTextField()
        tf.placeholder = "Password"
        return tf
    }()
    
    let confirmPasswordTextfield: StuffedTextField = {
        let tf = StuffedTextField()
        tf.placeholder = "Confirm Password"
        return tf
    }()
    
    let registerButton: StuffedButton = {
        let button = StuffedButton()
        button.setTitle("Register", for: .normal)
        button.backgroundColor = .stuffedBlue
        button.layer.cornerRadius = 5
        return button
    }()
    
    let validator = Validator()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        createLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    private func createLayout() {
        
        let labelHeight: CGFloat = 40
        
        view.addSubview(cancelButton)
        cancelButton.anchor(centerX: nil, centerY: nil, top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 60, height: 20)
        
        view.addSubview(emailTextfield)
        emailTextfield.anchor(centerX: nil, centerY: nil, top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 100, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: labelHeight)
        
        view.addSubview(passwordTextfield)
        passwordTextfield.anchor(centerX: nil, centerY: nil, top: emailTextfield.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: labelHeight)
        
        view.addSubview(confirmPasswordTextfield)
        confirmPasswordTextfield.anchor(centerX: nil, centerY: nil, top: passwordTextfield.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: labelHeight)
        
        view.addSubview(registerButton)
        registerButton.anchor(centerX: view.centerXAnchor, centerY: nil, top: confirmPasswordTextfield.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 50)
    }

    func validationSuccessful() {
        //
    }
    
    func validationFailed(_ errors: [(Validatable, ValidationError)]) {
        //
    }

}

extension SignUpController {
    private func createTextfieldProperties() {
        
        let textFields: [StuffedTextField] = [emailTextfield, passwordTextfield, confirmPasswordTextfield]
        var tag = 0
        
        for textField in textFields {
            
            textField.delegate = self
            textField.tag = tag
            tag = tag + 1
        }
        
        validator.registerField(emailTextfield, rules: [RequiredRule(), EmailRule()])
        validator.registerField(passwordTextfield, rules: [RequiredRule(), PasswordRule()])
        validator.registerField(confirmPasswordTextfield, rules: [RequiredRule(), PasswordRule()])

    }
}
