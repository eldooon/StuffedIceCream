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
        return sv
    }()
    
    let contentView : UIView = {
        let view = UIView()
        return view
    }()
    
    let orderLabel: UILabel = {
        let label = UILabel()
        label.text = "Order Form"
        return label
    }()
    
    let firstNameTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .stuffedBlue
        tf.placeholder = "First Name"
        tf.becomeFirstResponder()
        return tf
    }()

    let lastNameTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .stuffedBlue
        tf.placeholder = "Last Name"
        tf.becomeFirstResponder()
        return tf
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .stuffedBlue
        tf.placeholder = "Email Address"
        tf.becomeFirstResponder()
        return tf
    }()
    
    let phoneNumberTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .stuffedBlue
        tf.placeholder = "Phone Number"
        tf.becomeFirstResponder()
        return tf
    }()
    
    let address1TextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .stuffedBlue
        tf.placeholder = "Address 1"
        tf.becomeFirstResponder()
        return tf
    }()
    
    let address2TextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .stuffedBlue
        tf.placeholder = "Address 2"
        tf.becomeFirstResponder()
        return tf
    }()
    
    let cityTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .stuffedBlue
        tf.placeholder = "City"
        tf.becomeFirstResponder()
        return tf
    }()
    
    let stateTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .stuffedBlue
        tf.placeholder = "State/Province"
        tf.becomeFirstResponder()
        return tf
    }()
    
    let zipcodeTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .stuffedBlue
        tf.placeholder = "Zipcode"
        tf.becomeFirstResponder()
        return tf
    }()
    
    let countryTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .stuffedBlue
        tf.placeholder = "Country"
        tf.becomeFirstResponder()
        return tf
    }()
    
    let guestTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .stuffedBlue
        tf.placeholder = "Number of Guests"
        tf.becomeFirstResponder()
        return tf
    }()
    
    let dateTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .stuffedBlue
        tf.placeholder = "Date"
        tf.becomeFirstResponder()
        return tf
    }()
    
    let timeTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .stuffedBlue
        tf.placeholder = "Time"
        tf.becomeFirstResponder()
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = "Catering"
        view.backgroundColor = .white
        createLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func createLayout() {
        
        view.addSubview(scrollView)
        scrollView.anchor(centerX: nil, centerY: nil, top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        scrollView.addSubview(contentView)
        contentView.anchor(centerX: nil, centerY: nil, top: scrollView.topAnchor, left: nil, bottom: scrollView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: self.view.bounds.width, height: scrollView.frame.height)
        
        contentView.addSubview(orderLabel)
        orderLabel.anchor(centerX: nil, centerY: nil, top: contentView.topAnchor, left: contentView.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 0)
        
        contentView.addSubview(firstNameTextField)
        firstNameTextField.anchor(centerX: nil, centerY: nil, top: orderLabel.bottomAnchor, left: contentView.leftAnchor, bottom: nil, right: contentView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 30)
        
        contentView.addSubview(lastNameTextField)
        lastNameTextField.anchor(centerX: nil, centerY: nil, top: firstNameTextField.bottomAnchor, left: firstNameTextField.leftAnchor, bottom: nil, right: firstNameTextField.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
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
