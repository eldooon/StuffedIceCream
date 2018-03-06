//
//  HeaderItem.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 2/13/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

public class HeaderItem {
    
    var image: String?
    
    init(dictionary: [String: Any]) {
        
        self.image = dictionary["Image"] as? String ?? ""
    }
    
    
}
