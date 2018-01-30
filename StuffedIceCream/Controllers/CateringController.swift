//
//  CateringController.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 1/26/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit
import SwiftValidator

class CateringController: UIViewController, UITextFieldDelegate, ValidationDelegate {

    let validator = Validator()
    
    var scrollView : UIScrollView = {
        let sv = UIScrollView()
        sv.isUserInteractionEnabled = true
        sv.isScrollEnabled = true
        return sv
    }()
    
    let orderLabel: UILabel = {
        let label = UILabel()
        label.text = "Order Form"
        label.font = label.font.withSize(18)
        return label
    }()
    
    let customerInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Customer Information"
        return label
    }()
    
    let fullNameTextField: StuffedTextField = {
        let tf = StuffedTextField()
        tf.placeholder = "Full Name"
        tf.isUserInteractionEnabled = true
        return tf
    }()

    
    let emailTextField: StuffedTextField = {
        let tf = StuffedTextField()
        tf.placeholder = "Email Address"
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    let phoneNumberTextField: StuffedTextField = {
        let tf = StuffedTextField()
        tf.placeholder = "Phone Number"
        return tf
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Address"
        return label
    }()
    
    let address1TextField: StuffedTextField = {
        let tf = StuffedTextField()
        tf.placeholder = "Address 1"
        return tf
    }()
    
    let address2TextField: StuffedTextField = {
        let tf = StuffedTextField()
        tf.placeholder = "Address 2"
        return tf
    }()
    
    let cityTextField: StuffedTextField = {
        let tf = StuffedTextField()
        tf.placeholder = "City"
        return tf
    }()
    
    let stateTextField: StuffedTextField = {
        let tf = StuffedTextField()
        tf.placeholder = "State/Province"
        return tf
    }()
    
    let zipcodeTextField: StuffedTextField = {
        let tf = StuffedTextField()
        tf.placeholder = "Zipcode"
        tf.keyboardType = .numberPad
        return tf
    }()
    
    let countryTextField: StuffedTextField = {
        let tf = StuffedTextField()
        tf.placeholder = "Country"
        return tf
    }()
    
    
    let eventInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Event Information"
        return label
    }()
    
    let guestTextField: StuffedTextField = {
        let tf = StuffedTextField()
        tf.placeholder = "Number of Guests"
        tf.keyboardType = .numberPad
        return tf
    }()
    
    let dateTextField: StuffedTextField = {
        let tf = StuffedTextField()
        tf.placeholder = "Date"
        tf.keyboardType = .numbersAndPunctuation
        return tf
    }()
    
    let timeTextField: StuffedTextField = {
        let tf = StuffedTextField()
        tf.placeholder = "Time"
        tf.keyboardType = .numbersAndPunctuation
        return tf
    }()
    
    let selectionLabel: UILabel = {
        let label = UILabel()
        label.text = "Would you like us to serve Cruffs, Ice Cream, Or Both?"
        label.font = label.font.withSize(12)
        return label
    }()
    
    let selectionSC: UISegmentedControl = {
        let items = ["Cruff", "Ice Cream", "Both"]
        let sc = UISegmentedControl(items: items)
        return sc
    }()
    
    let requestTextfield: UITextView = {
        let tv = UITextView()
        tv.backgroundColor = .stuffedBlue
        tv.text = "Please enter special request here:"
        return tv
    }()
    
    let submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.backgroundColor = .stuffedBlue
        button.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = "Catering"
        view.backgroundColor = .white
        
        createTextfieldProperties()
        createLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func createTextfieldProperties() {
        fullNameTextField.delegate = self
        emailTextField.delegate = self
        phoneNumberTextField.delegate = self
        address1TextField.delegate = self
        address2TextField.delegate = self
        cityTextField.delegate = self
        zipcodeTextField.delegate = self
        countryTextField.delegate = self
        guestTextField.delegate = self
        dateTextField.delegate = self
        timeTextField.delegate = self
        
        validator.registerField(fullNameTextField, rules: [RequiredRule(), FullNameRule()])
        validator.registerField(emailTextField, rules: [RequiredRule(), EmailRule()])
        validator.registerField(phoneNumberTextField, rules: [RequiredRule(), PhoneNumberRule()])
        validator.registerField(address1TextField, rules: [RequiredRule()])
        validator.registerField(cityTextField, rules: [RequiredRule()])
        validator.registerField(stateTextField, rules: [RequiredRule()])
        validator.registerField(zipcodeTextField, rules: [RequiredRule(), ZipCodeRule()])
        validator.registerField(guestTextField, rules: [RequiredRule()])
        validator.registerField(dateTextField, rules: [RequiredRule()])
        validator.registerField(timeTextField, rules: [RequiredRule()])
    }
    
    private func createLayout() {
        
        view.addSubview(scrollView)
        scrollView.anchor(centerX: nil, centerY: nil, top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        scrollView.addSubview(orderLabel)
        orderLabel.anchor(centerX: nil, centerY: nil, top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 0)
        
        scrollView.addSubview(customerInfoLabel)
        customerInfoLabel.anchor(centerX: nil, centerY: nil, top: orderLabel.bottomAnchor, left: orderLabel.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width-20, height: 0)
        
        scrollView.addSubview(fullNameTextField)
        fullNameTextField.anchor(centerX: nil, centerY: nil, top: customerInfoLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: view.frame.width-20, height: 30)
        
        scrollView.addSubview(emailTextField)
        emailTextField.anchor(centerX: nil, centerY: nil, top: fullNameTextField.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: fullNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        scrollView.addSubview(phoneNumberTextField)
        phoneNumberTextField.anchor(centerX: nil, centerY: nil, top: emailTextField.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: fullNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        scrollView.addSubview(addressLabel)
        addressLabel.anchor(centerX: nil, centerY: nil, top: phoneNumberTextField.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        scrollView.addSubview(address1TextField)
        address1TextField.anchor(centerX: nil, centerY: nil, top: addressLabel.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: fullNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        scrollView.addSubview(address2TextField)
        address2TextField.anchor(centerX: nil, centerY: nil, top: address1TextField.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: fullNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        scrollView.addSubview(cityTextField)
        cityTextField.anchor(centerX: nil, centerY: nil, top: address2TextField.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: fullNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        scrollView.addSubview(stateTextField)
        stateTextField.anchor(centerX: nil, centerY: nil, top: cityTextField.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: fullNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        scrollView.addSubview(zipcodeTextField)
        zipcodeTextField.anchor(centerX: nil, centerY: nil, top: stateTextField.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: fullNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        scrollView.addSubview(countryTextField)
        countryTextField.anchor(centerX: nil, centerY: nil, top: zipcodeTextField.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: fullNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        scrollView.addSubview(eventInfoLabel)
        eventInfoLabel.anchor(centerX: nil, centerY: nil, top: countryTextField.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        scrollView.addSubview(guestTextField)
        guestTextField.anchor(centerX: nil, centerY: nil, top: eventInfoLabel.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: fullNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        scrollView.addSubview(dateTextField)
        dateTextField.anchor(centerX: nil, centerY: nil, top: guestTextField.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: fullNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        scrollView.addSubview(timeTextField)
        timeTextField.anchor(centerX: nil, centerY: nil, top: dateTextField.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: fullNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        scrollView.addSubview(selectionLabel)
        selectionLabel.anchor(centerX: nil, centerY: nil, top: timeTextField.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        scrollView.addSubview(selectionSC)
        selectionSC.anchor(centerX: nil, centerY: nil, top: selectionLabel.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: fullNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        
        scrollView.addSubview(requestTextfield)
        requestTextfield.anchor(centerX: nil, centerY: nil, top: selectionSC.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: fullNameTextField.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 100)
        
        scrollView.addSubview(submitButton)
        submitButton.anchor(centerX: nil, centerY: nil, top: requestTextfield.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: fullNameTextField.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 100)
    }
    
    override func viewWillLayoutSubviews() {
        scrollView.isScrollEnabled = true
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 1000)
    }
    
    @objc func submitButtonTapped() {
        print("Submit Button Tapped")
        validator.validate(self)
    }
    
    func validationSuccessful() {
        print("SUCCESS")
    }
    
    func validationFailed(_ errors: [(Validatable, ValidationError)]) {
        for (field, error) in errors {
            if let field = field as? UITextField {
                field.layer.borderColor = UIColor.red.cgColor
                field.layer.borderWidth = 1.0
            }
            error.errorLabel?.text = error.errorMessage // works if you added labels
            error.errorLabel?.isHidden = false
        }
    }
    
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
