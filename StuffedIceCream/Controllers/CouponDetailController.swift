//
//  CouponDetailController.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 3/19/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class CouponDetailController: UIViewController {
    
    let database = FireBaseData.sharedInstance
    
    var coupon: Coupon? {
        didSet {
            if let couponName = coupon?.name {
                couponNameLabel.text = couponName
            }
            
            if let couponDescription = coupon?.description {
                couponDescriptionTextView.text = couponDescription
            }
            
            if let couponImageURL = coupon?.image {
                couponImageView.loadImage(urlString: couponImageURL)
            }
        }
    }
    
    let couponImageView: StuffedImageView = {
        let iv = StuffedImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    let couponNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Coupon Name"
        label.font = UIFont.titlesSmall
        return label
    }()
    
    let couponDescriptionTextView: UITextView = {
        let tv = UITextView()
        tv.font = UIFont.commentsBold
        tv.text = "Coupon Description"
        tv.isUserInteractionEnabled = false
        tv.textAlignment = .center
        return tv
    }()

    let claimButton: StuffedBlueButton = {
        let button = StuffedBlueButton()
        button.setTitle("Claim", for: .normal)
        button.addTarget(self, action: #selector(claimButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var myAccountVC = MyAccountController()
    
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
    
    @objc func claimButtonTapped () {
        if let coupon = coupon {
            self.presentOptionAlertControllerWithCompletion(title: "Confirm", message: "Are you sure you want to claim this coupon?", completion: {
                self.database.removeCoupon(coupon: coupon)
                self.navigationController?.popViewController(animated: true, completion: {
                    self.myAccountVC.reFetchUserInfo()
                })
            })
        }
    }
    
    private func createLayout() {
        
        view.addSubview(couponImageView)
        couponImageView.anchor(centerX: nil, centerY: nil, top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 200)
        
        view.addSubview(couponNameLabel)
        couponNameLabel.anchor(centerX: view.centerXAnchor, centerY: nil, top: couponImageView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(couponDescriptionTextView)
        couponDescriptionTextView.anchor(centerX: nil, centerY: nil, top: couponNameLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 420)
        
        view.addSubview(claimButton)
        claimButton.anchor(centerX: view.centerXAnchor, centerY: nil, top: nil, left: nil, bottom: view.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 20, paddingRight: 10, width: 200, height: 50)
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
