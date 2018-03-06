//
//  HeaderItem.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 2/13/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

public class HeaderItem {
    
    var image: UIImage?
    
    init(dictionary: [String: Any]) {
        
        self.image = ImageConversion.convertStringToImage(imageURL: dictionary["Image"] as! String)
            
//            dictionary["Image"] as? String ?? ""
    }
    
    
}
