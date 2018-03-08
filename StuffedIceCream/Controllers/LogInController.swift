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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        createLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func createLayout() {
        
        view.addSubview(logoImageView)
        logoImageView.anchor(centerX: view.centerXAnchor, centerY: nil, top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200, height: 200)
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
