//
//  MenuItem.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 2/3/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

public class MenuItem {
    
    var image: UIImage?
    var name: String?
    var description: String?
    
    init(dictionary: [String: Any]) {
        
        self.name = dictionary["Name"] as? String ?? ""
        self.description = dictionary["Description"] as? String ?? ""
        guard let imageURL = URL(string: dictionary["Image"] as? String ?? "") else { return }
        guard let imageData = try? Data(contentsOf: imageURL) else { return }
        self.image = UIImage(data: imageData)
    }
    
}

