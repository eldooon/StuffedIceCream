//
//  User.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 3/13/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

public class User {

    var name: String?
    var birthday: String?
    var email: String?
    
    init(dictionary: [String: Any]) {
        
        self.name = dictionary["Name"] as? String ?? ""
        self.birthday = dictionary["Birthday"] as? String ?? ""
        self.email = dictionary["Email"] as? String ?? ""
    }
    
}
