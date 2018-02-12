//
//  MediaItem.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 2/12/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

public class MediaItem {
    
    let mediaImage: UIImage?
    
    init(Image: UIImage?){
    
        mediaImage  = Image
    }
    
}

class MediaItems {
    
    let items = [MediaItem(Image: #imageLiteral(resourceName: "Insider")), MediaItem(Image: #imageLiteral(resourceName: "Thrillist")), MediaItem(Image: #imageLiteral(resourceName: "BuzzFeed")), MediaItem(Image: #imageLiteral(resourceName: "Eater")), MediaItem(Image: #imageLiteral(resourceName: "NBC")), MediaItem(Image:#imageLiteral(resourceName: "Fox5")), MediaItem(Image: #imageLiteral(resourceName: "Gothamist")), MediaItem(Image: #imageLiteral(resourceName: "TimeOutNY")), MediaItem(Image: #imageLiteral(resourceName: "Best")), MediaItem(Image: #imageLiteral(resourceName: "Cosmopolitan")), MediaItem(Image: #imageLiteral(resourceName: "FoodNetwork")), MediaItem(Image: #imageLiteral(resourceName: "DiningWithSkyler")), MediaItem(Image: #imageLiteral(resourceName: "Where")), MediaItem(Image: #imageLiteral(resourceName: "ExtraCrispy")), MediaItem(Image: #imageLiteral(resourceName: "Refinery29")), MediaItem(Image: #imageLiteral(resourceName: "ForkYeah")), MediaItem(Image: #imageLiteral(resourceName: "Metro")), MediaItem(Image: #imageLiteral(resourceName: "Bedford+Bowery"))]
}
