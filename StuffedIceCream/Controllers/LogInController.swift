//
//  LogInController.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 3/8/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class LogInController: UIViewController {
    
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
        button.backgroundColor = .stuffedBlue
        button.layer.cornerRadius = 5
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        createLayout()
        hideKeyboardWhenTapped()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func signUpButtonTapped() {
        
        present(SignUpController(), animated: true, completion: nil)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
