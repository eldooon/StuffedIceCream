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
    let mediaLink: String?
    
    init(Image: UIImage?, Link: String?){
    
        mediaImage = Image
        mediaLink = Link
    }
    
}

class MediaItems {
    
    let items = [MediaItem(Image: #imageLiteral(resourceName: "Insider"), Link: nil), MediaItem(Image: #imageLiteral(resourceName: "Thrillist"), Link: nil), MediaItem(Image: #imageLiteral(resourceName: "BuzzFeed"), Link: nil), MediaItem(Image: #imageLiteral(resourceName: "Eater"), Link: nil), MediaItem(Image: #imageLiteral(resourceName: "NBC"), Link: nil), MediaItem(Image:#imageLiteral(resourceName: "Fox5"), Link: nil), MediaItem(Image: #imageLiteral(resourceName: "Gothamist"), Link: nil), MediaItem(Image: #imageLiteral(resourceName: "TimeOutNY"), Link: nil), MediaItem(Image: #imageLiteral(resourceName: "Best"), Link: nil), MediaItem(Image: #imageLiteral(resourceName: "Cosmopolitan"), Link: nil), MediaItem(Image: #imageLiteral(resourceName: "FoodNetwork"), Link: nil), MediaItem(Image: #imageLiteral(resourceName: "DiningWithSkyler"), Link: nil), MediaItem(Image: #imageLiteral(resourceName: "Where"), Link: nil), MediaItem(Image: #imageLiteral(resourceName: "ExtraCrispy"), Link: nil), MediaItem(Image: #imageLiteral(resourceName: "Refinery29"), Link: nil), MediaItem(Image: #imageLiteral(resourceName: "ForkYeah"), Link: nil), MediaItem(Image: #imageLiteral(resourceName: "Metro"), Link: nil), MediaItem(Image: #imageLiteral(resourceName: "Bedford+Bowery"), Link: nil)]
    
    let socialItems = [MediaItem(Image: #imageLiteral(resourceName: "Facebook"), Link: "https://www.facebook.com/StuffedIceCreamNYC"), MediaItem(Image: #imageLiteral(resourceName: "Instagram"), Link: "https://www.instagram.com/stuffedicecreamnyc")]
}

