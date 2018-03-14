//
//  Coupon.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 3/14/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import Foundation

public class Coupon {
    
    var name: String?
    var description: String?
    var image: String?
    
    init(dictionary: [String: Any]) {
        
        self.name = dictionary["Name"] as? String ?? ""
        self.description = dictionary["Description"] as? String ?? ""
        self.image = dictionary["Image"] as? String ?? ""
    }
    
}
