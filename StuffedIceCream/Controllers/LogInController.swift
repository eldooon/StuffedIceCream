//
//  LogInController.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 3/8/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit
import FirebaseAuth
import SwiftValidator

class LogInController: UIViewController, UITextFieldDelegate {
    
    let validator = Validator()
    
    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "logo")
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
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
    
    let loginButton: StuffedButton = {
        let button = StuffedButton()
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let signupButton: StuffedButton = {
        let button = StuffedButton()
        let stringAttributes : [NSAttributedStringKey: Any] = [
            NSAttributedStringKey.font : UIFont.comments ?? .systemFont(ofSize: 12),
            NSAttributedStringKey.foregroundColor : UIColor.gray,
            NSAttributedStringKey.underlineStyle : NSUnderlineStyle.styleSingle.rawValue]
        let title = NSMutableAttributedString(string: "Not registered? Click here to Sign Up.", attributes: stringAttributes)
        button.setAttributedTitle(title, for: .normal)
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var myAccountVC: MyAccountController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Log In"
        let backButton = UIBarButtonItem(image: #imageLiteral(resourceName: "back"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
        view.backgroundColor = .white
        createLayout()
        hideKeyboardWhenTapped()
        createTextfieldProperties()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func loginButtonTapped() {
       print("Login button tapped")
        
        guard let email = emailTextfield.text else {return}
        guard let password = passwordTextfield.text else {return}
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let err = error {
                self.presentAlertController(title: "Uh Oh", message: err.localizedDescription)
                return
            }
            
            print("Succesfully authenticated")
            self.dismiss(animated: true, completion: {
                self.myAccountVC?.reFetchUserInfo()
            })
        }
    }
    
    @objc func signUpButtonTapped() {
        
        present(SignUpController(), animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let stuffedTF = textField as? StuffedTextField {
            if let nextField = stuffedTF.superview?.viewWithTag(stuffedTF.tag + 1) as? StuffedTextField {
                nextField.becomeFirstResponder()
            } else {
                stuffedTF.resignFirstResponder()
            }
        
        }
        
        return true
    }

}

extension LogInController {
    
    private func createTextfieldProperties() {
        
        let textFields: [StuffedTextField] = [emailTextfield, passwordTextfield]
        var tag = 0
        
        for textField in textFields {
            
            textField.delegate = self
            textField.tag = tag
            tag = tag + 1
        }
        
        validator.registerField(emailTextfield, rules: [RequiredRule(), EmailRule()])
        validator.registerField(passwordTextfield, rules: [RequiredRule()])
    }
    
    private func createLayout() {
        
        let labelHeight: CGFloat = 40
        
        view.addSubview(logoImageView)
        logoImageView.anchor(centerX: view.centerXAnchor, centerY: nil, top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200, height: 200)
        
        view.addSubview(emailTextfield)
        emailTextfield.anchor(centerX: nil, centerY: nil, top: logoImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: labelHeight)
        
        view.addSubview(passwordTextfield)
        passwordTextfield.anchor(centerX: nil, centerY: nil, top: emailTextfield.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: labelHeight)
        
        view.addSubview(loginButton)
        loginButton.anchor(centerX: view.centerXAnchor, centerY: nil, top: passwordTextfield.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 50)
        
        view.addSubview(signupButton)
        signupButton.anchor(centerX: view.centerXAnchor, centerY: nil, top: loginButton.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 250, height: 20)
    }

}
