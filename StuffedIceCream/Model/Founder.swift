//
//  Founder.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 1/24/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import UIKit

public class Founder {
    
    let founderName: String?
    let founderImage: UIImage?
    let founderDescription: String?
    
    init(Image: UIImage?, Name: String?, Description: String?){
        
        founderName = Name
        founderImage  = Image
        founderDescription = Description
    }
    
}

public let founders = [
    Founder(Image: #imageLiteral(resourceName: "founderAlan"),
            Name: "Alan Yaung",
            Description: "I am Alan Yaung, of House S.I.C. Rightful heir to the Ice Cream Throne, King of the Cruffs. I am the Mother of Donuts, the Khaleesi of Ice Cream Bouquets and Breaker of Calories.\n\nAlan is a Brooklyn native who never imagined opening up his own business, let alone an ice cream parlor. After graduating with a Bachelor's in Chemistry and working on a path to healthcare, he realized it wasn't right for him. Jackie approached Alan about this business opportunity while he was in the middle of switching careers. As a risk taker and always first to jump at things, Alan dove right in without hesitation. The journey has been a huge learning curve for someone who studied science almost his whole life. With ambition to be the best at anything he does, whether it comes to sports or seeing who could do the spicy ramen challenge the fastest, he pushes himself to work hard to compete with the top dessert shops in NYC."),
    Founder(Image: #imageLiteral(resourceName: "founderJackie"),
            Name: "JACKIE LUU",
            Description: "Coming from a family of food entrepreneurs, Jackie stormed into the world with a spoon-in-hand and an insatiable craving for all things sweet.  As others grew up developing a fondness of the playground, Jackie found himself never leaving the home kitchen.  There was no stool he wouldn’t climb, no closet he wouldn’t open in the never-ending search for dessert.  Hard to believe, but he truly found love at a very young age.\n\nFast forward to the pivotal and life-defining years at Baruch College, Jackie embarked on another pursuit, but this time for an even greater purpose: what career path provides uncompromising fun, promise, and deliciousness all at the same time?  The answer was a recipe that included simple ingredients from the most humbling parts of his life: encouragement from childhood friends (who else would be guinea pigs for his absurd ice cream flavors?), wisdom from successful and entrepreneurial parents, and a fiery passion for ice cream – why yes, that does sound like an appropriate oxymoron.  In short, Jackie and his business partner and longtime friend, Alan, founded Stuffed Ice Cream.\n\nIn his spare time, Jackie is an automotive enthusiast and a gifted marathon napper.  Besides spending time with his parents and older brother, who lacks the same uncanny napping abilities (sadly), Jackie is excited about his plans to travel the world, and looks forward to the many more backpacking trips he plans to take in the future.")]

