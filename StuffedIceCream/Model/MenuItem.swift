//
//  File.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 1/23/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

public class MenuItem {
    
    let menuName: String?
    let menuImage: UIImage?
    
    init(Image: UIImage?, Name: String?){
        
        menuName = Name
        menuImage  = Image
    }
    
}

class MenuItems {
    
    let items = [MenuItem(Image: nil, Name: "About"), MenuItem(Image: nil, Name: "Menu"), MenuItem(Image: nil, Name: "Catering"), MenuItem(Image: nil, Name: "Jobs"), MenuItem(Image: nil, Name: "Shop")]
}


