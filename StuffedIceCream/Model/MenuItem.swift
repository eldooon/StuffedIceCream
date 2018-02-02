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
    
    let items = [MenuItem(Image: #imageLiteral(resourceName: "aboutIcon"), Name: "About"), MenuItem(Image: #imageLiteral(resourceName: "jobIcon"), Name: "Location"), MenuItem(Image: #imageLiteral(resourceName: "menuIcon"), Name: "Menu"), MenuItem(Image: #imageLiteral(resourceName: "cateringIcon"), Name: "Catering"), MenuItem(Image: #imageLiteral(resourceName: "shopIcon"), Name: "Shop")]
}


