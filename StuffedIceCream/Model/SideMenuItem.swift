//
//  SideMenuItem.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 2/3/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

public class SideMenuItem {
    
    let menuName: String?
    let menuImage: UIImage?
    
    init(Image: UIImage?, Name: String?){
        
        menuName = Name
        menuImage  = Image
    }
    
}

class MenuItems {
    
    let items = [SideMenuItem(Image: #imageLiteral(resourceName: "aboutIcon"), Name: "My Account"),SideMenuItem(Image: #imageLiteral(resourceName: "aboutIcon"), Name: "About"), SideMenuItem(Image: #imageLiteral(resourceName: "jobIcon"), Name: "Location"), SideMenuItem(Image: #imageLiteral(resourceName: "menuIcon"), Name: "Menu"), SideMenuItem(Image: #imageLiteral(resourceName: "cateringIcon"), Name: "Catering")]//, SideMenuItem(Image: #imageLiteral(resourceName: "shopIcon"), Name: "Shop")]
}
