//
//  CateringController.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 1/26/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit
import SwiftValidator
import SwiftMailgun

class CateringController: UIViewController, UITextFieldDelegate, ValidationDelegate {

    let validator = Validator()
    
    let mailgun = MailgunAPI(apiKey: MailgunInfo.key, clientDomain: MailgunInfo.domain)
    
    var scrollView : UIScrollView = {
        let sv = UIScrollView()
        sv.isUserInteractionEnabled = true
        sv.isScrollEnabled = true
        return sv
    }()
    
    let orderLabel: UILabel = {
        let label = UILabel()
        label.text = "Order Form"
        label.font = UIFont.titles
        return label
    }()
    
    let customerInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Customer Information"
        label.font = UIFont.primary
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
        label.font = UIFont.primary
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
        label.font = UIFont.primary
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
        label.font = UIFont.comments
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
        navigationItem.title = "CATERING"
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
        
        let labelHeight: CGFloat = 40
        
        view.addSubview(scrollView)
        scrollView.anchor(centerX: nil, centerY: nil, top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        scrollView.addSubview(orderLabel)
        orderLabel.anchor(centerX: nil, centerY: nil, top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 0)
        
        scrollView.addSubview(customerInfoLabel)
        customerInfoLabel.anchor(centerX: nil, centerY: nil, top: orderLabel.bottomAnchor, left: orderLabel.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width-20, height: 0)
        
        scrollView.addSubview(fullNameTextField)
        fullNameTextField.anchor(centerX: nil, centerY: nil, top: customerInfoLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: view.frame.width-20, height: labelHeight)
        
        scrollView.addSubview(emailTextField)
        emailTextField.anchor(centerX: nil, centerY: nil, top: fullNameTextField.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: fullNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: labelHeight)
        
        scrollView.addSubview(phoneNumberTextField)
        phoneNumberTextField.anchor(centerX: nil, centerY: nil, top: emailTextField.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: fullNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: labelHeight)
        
        scrollView.addSubview(addressLabel)
        addressLabel.anchor(centerX: nil, centerY: nil, top: phoneNumberTextField.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        scrollView.addSubview(address1TextField)
        address1TextField.anchor(centerX: nil, centerY: nil, top: addressLabel.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: fullNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: labelHeight)
        
        scrollView.addSubview(address2TextField)
        address2TextField.anchor(centerX: nil, centerY: nil, top: address1TextField.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: fullNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: labelHeight)
        
        scrollView.addSubview(cityTextField)
        cityTextField.anchor(centerX: nil, centerY: nil, top: address2TextField.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: fullNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: labelHeight)
        
        scrollView.addSubview(stateTextField)
        stateTextField.anchor(centerX: nil, centerY: nil, top: cityTextField.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: fullNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: labelHeight)
        
        scrollView.addSubview(zipcodeTextField)
        zipcodeTextField.anchor(centerX: nil, centerY: nil, top: stateTextField.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: fullNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: labelHeight)
        
        scrollView.addSubview(countryTextField)
        countryTextField.anchor(centerX: nil, centerY: nil, top: zipcodeTextField.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: fullNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: labelHeight)
        
        scrollView.addSubview(eventInfoLabel)
        eventInfoLabel.anchor(centerX: nil, centerY: nil, top: countryTextField.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        scrollView.addSubview(guestTextField)
        guestTextField.anchor(centerX: nil, centerY: nil, top: eventInfoLabel.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: fullNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: labelHeight)
        
        scrollView.addSubview(dateTextField)
        dateTextField.anchor(centerX: nil, centerY: nil, top: guestTextField.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: fullNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: labelHeight)
        
        scrollView.addSubview(timeTextField)
        timeTextField.anchor(centerX: nil, centerY: nil, top: dateTextField.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: fullNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: labelHeight)
        
        scrollView.addSubview(selectionLabel)
        selectionLabel.anchor(centerX: nil, centerY: nil, top: timeTextField.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        scrollView.addSubview(selectionSC)
        selectionSC.anchor(centerX: nil, centerY: nil, top: selectionLabel.bottomAnchor, left: fullNameTextField.leftAnchor, bottom: nil, right: fullNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: labelHeight)
        
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
        let alertController = UIAlertController(title: "Submit", message: "Is everything correct?", preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            //
        }
        
        let okButton = UIAlertAction(title: "OK", style: .default) { (action) in
            self.mailgun.sendEmail(to: MailgunInfo.email, from: MailgunInfo.email, subject: "Catering Order #", bodyHTML: "<b>Full Name:</b> \(self.fullNameTextField.text!)<br><b>Email Address:</b> \(self.emailTextField.text!)<br><b>Phone Number:</b> \(self.phoneNumberTextField.text!)<br><b>Address 1:</b> \(self.address1TextField.text!)<br><b>Address 2:</b> \(self.address2TextField.text!)<br><b>City:</b> \(self.cityTextField.text!),<br><b>State:</b> \(self.stateTextField.text!)<br><b>Zipcode:</b> \(self.zipcodeTextField.text!)<br><b>Guest #:</b> \(self.guestTextField.text!)<br><b>Date:</b> \(self.dateTextField.text!)<br><b>Time:</b> \(self.timeTextField.text!)") { mailgunResult in
                
                if mailgunResult.success{
                    print("Email was sent")
                }
                
            }
        }
        
        alertController.addAction(okButton)
        alertController.addAction(cancelButton)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func validationFailed(_ errors: [(Validatable, ValidationError)]) {
        for (field, error) in errors {
            if let field = field as? StuffedTextField {
                field.borderActiveColor = .red
                field.borderInactiveColor = .red
            }
            error.errorLabel?.text = error.errorMessage // works if you added labels
            error.errorLabel?.isHidden = false
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        validator.validateField(textField){ error in
            if error == nil {
                let stuffedTF = textField as? StuffedTextField
                stuffedTF?.borderActiveColor = .stuffedBlue
                stuffedTF?.borderInactiveColor = .stuffedBlue
            } else {
                let stuffedTF = textField as? StuffedTextField
                stuffedTF?.borderActiveColor = .red
                stuffedTF?.borderInactiveColor = .red
            }
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == phoneNumberTextField {
            if range.location == 12 {
                return false
            }
            
            if range.length == 0 && (range.location == 3 || range.location == 7) {
                textField.text = "\(textField.text!)-\(string)"
                return false
            }
        }
        
        return true
    }

}
