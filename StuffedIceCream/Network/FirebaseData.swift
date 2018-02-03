//
//  FirebaseData.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 2/3/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import FirebaseDatabase

class FireBaseData {
    
    static let sharedInstance = FireBaseData()
    var menuDatabase = [MenuCategory]()
    let ref = Database.database().reference().child("Menu")
    
    
    func retrieveData(completion: @escaping () -> ()) {
        
        print("Fetching Data")
        ref.observe(.value, with: { (snapshot) in
            
            guard let dictionaries = snapshot.value as? [String: Any] else { return }
            dictionaries.forEach({ (key, value) in
                let newItemCategory = MenuCategory()
                newItemCategory.name = key
                
                guard let testvalue = value as? [String: Any] else { return }
                for eachValue in testvalue {
                    guard let value = eachValue.value as? [String: Any] else {return}
                    let item = MenuItem(dictionary: value)
                    newItemCategory.items.append(item)
                    print("eachvalue", eachValue.value)
                }
                self.menuDatabase.append(newItemCategory)
            })
            completion()
        })
        
    }
    
}
