//
//  ConvertStringToImage.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 2/23/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

class ImageConversion {
    
    static func convertStringToImage (imageURL: String, imageView: UIImageView) {
        
        guard let url = URL(string: imageURL) else { return }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, err) in
            if let err = err {
                print("Failed to convert this image due to", err)
            }
            
            guard let imageData = data else { return }
            let image = UIImage(data: imageData)
            
            DispatchQueue.main.async {
                imageView.image = image
            }
            
        }).resume()
    }
    
}
