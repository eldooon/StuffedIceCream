//
//  MenuItem.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 2/3/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

public class MenuItem {
    
    var image: String?
    var name: String?
    var description: String?
    
    init(dictionary: [String: Any]) {
        
        self.name = dictionary["Name"] as? String ?? ""
        self.description = dictionary["Description"] as? String ?? ""
        self.image = dictionary["Image"] as? String ?? ""
    }
    
    
}

