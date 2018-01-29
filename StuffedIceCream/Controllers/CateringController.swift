//
//  CateringController.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 1/26/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class CateringController: UIViewController, UITextFieldDelegate
{
    
    var scrollView : UIScrollView = {
        let sv = UIScrollView()
        sv.sizeToFit()
        sv.isUserInteractionEnabled = true
        return sv
    }()
    
//    let contentView : UIView = {
//        let view = UIView()
//        view.isUserInteractionEnabled = true
//        view.backgroundColor = .blue
//        return view
//    }()
    
    let orderLabel: UILabel = {
        let label = UILabel()
        label.text = "Order Form"
        return label
    }()
    
    let firstNameTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .stuffedBlue
        tf.placeholder = "First Name"
        tf.isUserInteractionEnabled = true
        return tf
    }()

    let lastNameTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .stuffedBlue
        tf.placeholder = "Last Name"
        return tf
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .stuffedBlue
        tf.placeholder = "Email Address"
        return tf
    }()
    
    let phoneNumberTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .stuffedBlue
        tf.placeholder = "Phone Number"
        return tf
    }()
    
    let address1TextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .stuffedBlue
        tf.placeholder = "Address 1"
        return tf
    }()
    
    let address2TextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .stuffedBlue
        tf.placeholder = "Address 2"
        return tf
    }()
    
    let cityTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .stuffedBlue
        tf.placeholder = "City"
        return tf
    }()
    
    let stateTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .stuffedBlue
        tf.placeholder = "State/Province"
        return tf
    }()
    
    let zipcodeTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .stuffedBlue
        tf.placeholder = "Zipcode"
        return tf
    }()
    
    let countryTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .stuffedBlue
        tf.placeholder = "Country"
        return tf
    }()
    
    let guestTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .stuffedBlue
        tf.placeholder = "Number of Guests"
        return tf
    }()
    
    let dateTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .stuffedBlue
        tf.placeholder = "Date"
        return tf
    }()
    
    let timeTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .stuffedBlue
        tf.placeholder = "Time"
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = "Catering"
        view.backgroundColor = .white
        
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        
        createLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func createLayout() {
        
        view.addSubview(scrollView)
        scrollView.anchor(centerX: nil, centerY: nil, top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
//        scrollView.addSubview(contentView)
//        contentView.anchor(centerX: nil, centerY: nil, top: scrollView.topAnchor, left: nil, bottom: scrollView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: self.view.bounds.width, height: scrollView.frame.height)
        
        scrollView.addSubview(orderLabel)
        orderLabel.anchor(centerX: nil, centerY: nil, top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 0)
        
        scrollView.addSubview(firstNameTextField)
        firstNameTextField.anchor(centerX: nil, centerY: nil, top: orderLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: view.frame.width-20, height: 30)
        
        scrollView.addSubview(lastNameTextField)
        lastNameTextField.anchor(centerX: nil, centerY: nil, top: firstNameTextField.bottomAnchor, left: firstNameTextField.leftAnchor, bottom: nil, right: firstNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        scrollView.addSubview(emailTextField)
        emailTextField.anchor(centerX: nil, centerY: nil, top: lastNameTextField.bottomAnchor, left: firstNameTextField.leftAnchor, bottom: nil, right: firstNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        scrollView.addSubview(phoneNumberTextField)
        phoneNumberTextField.anchor(centerX: nil, centerY: nil, top: emailTextField.bottomAnchor, left: firstNameTextField.leftAnchor, bottom: nil, right: firstNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        scrollView.addSubview(address1TextField)
        address1TextField.anchor(centerX: nil, centerY: nil, top: phoneNumberTextField.bottomAnchor, left: firstNameTextField.leftAnchor, bottom: nil, right: firstNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        scrollView.addSubview(address2TextField)
        address2TextField.anchor(centerX: nil, centerY: nil, top: address1TextField.bottomAnchor, left: firstNameTextField.leftAnchor, bottom: nil, right: firstNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        scrollView.addSubview(cityTextField)
        cityTextField.anchor(centerX: nil, centerY: nil, top: address2TextField.bottomAnchor, left: firstNameTextField.leftAnchor, bottom: nil, right: firstNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        scrollView.addSubview(zipcodeTextField)
        zipcodeTextField.anchor(centerX: nil, centerY: nil, top: cityTextField.bottomAnchor, left: firstNameTextField.leftAnchor, bottom: nil, right: firstNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        scrollView.addSubview(countryTextField)
        countryTextField.anchor(centerX: nil, centerY: nil, top: zipcodeTextField.bottomAnchor, left: firstNameTextField.leftAnchor, bottom: nil, right: firstNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        scrollView.addSubview(guestTextField)
        guestTextField.anchor(centerX: nil, centerY: nil, top: countryTextField.bottomAnchor, left: firstNameTextField.leftAnchor, bottom: nil, right: firstNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        scrollView.addSubview(dateTextField)
        dateTextField.anchor(centerX: nil, centerY: nil, top: guestTextField.bottomAnchor, left: firstNameTextField.leftAnchor, bottom: nil, right: firstNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        scrollView.addSubview(timeTextField)
        timeTextField.anchor(centerX: nil, centerY: nil, top: dateTextField.bottomAnchor, left: firstNameTextField.leftAnchor, bottom: nil, right: firstNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
    }
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//
//    }
//
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        return true
//    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

}
