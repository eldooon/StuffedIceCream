//
//  MyAccountController.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 3/7/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit
import FirebaseAuth

class MyAccountController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    private let cellId = "cellId"
    private let headerId = "headerId"
    private let footerId = "footerId"
    let database = FireBaseData.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "My Account"
        let logOutButton = UIBarButtonItem(image: #imageLiteral(resourceName: "setting"), style: .plain, target: self, action: #selector(logOutButtonTapped))
        navigationItem.rightBarButtonItem = logOutButton
        self.collectionView?.backgroundColor = .white
        self.collectionView?.register(CouponItemCell.self, forCellWithReuseIdentifier: cellId)
        self.collectionView?.register(MyAccountHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        self.collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerId)

        checkIfLoggedIn()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Current User: ", self.database.currentUser?.name)
        print("Current UID: ", Auth.auth().currentUser?.uid)
        print("Current Coupon Count: ", self.database.currentUser?.coupons?.count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func reFetchUserInfo() {
        self.collectionView?.reloadData()
        database.fetchUserInfo {
            self.collectionView?.reloadData()
        }
    }
    
    func checkIfLoggedIn() {
        
        if Auth.auth().currentUser == nil {

            print("not logged in")
            DispatchQueue.main.async {
                let loginController = LogInController()
                loginController.myAccountVC = self
                let navController = StuffedNavController(rootViewController: loginController)
                self.present(navController, animated: true, completion: nil)
            }
            
            return
        } else {
            print("Already logged in")
        }
    }
    
    @objc func logOutButtonTapped() {
        
        do {
            try Auth.auth().signOut()
            reFetchUserInfo()
            checkIfLoggedIn()
        } catch let err {
            print("Unable to sign out", err)
        }
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        
        if let count = database.currentUser?.coupons?.count {
            return count
        }
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CouponItemCell
    
        let userCoupon = database.currentUser?.coupons?[indexPath.item]
        cell.coupon = userCoupon
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (view.frame.width/2)-1, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind  {
        case UICollectionElementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId, for: indexPath) as! MyAccountHeaderCell
            
            header.user = database.currentUser
            header.myAccountVC = self
            header.isUserInteractionEnabled = true
            
            return header
            
        case UICollectionElementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerId, for: indexPath)
            footer.backgroundColor = .blue
            return footer
            
        default:
            assert(false, "Unexpected element kind")
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if database.currentUser?.coupons != nil {
            return CGSize(width: 0, height: 0)
        } else {
            return CGSize(width: view.frame.width, height: 200)
        }
    }

}
