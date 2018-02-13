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
    var frontpageDatabase = [String]()
    let ref = Database.database().reference().child("Menu")
    let ref2 = Database.database().reference().child("Frontpage")
    
    
    func fetchMenuData(completion: @escaping () -> ()) {
        
        ref.observeSingleEvent(of: .value) { (snapshot) in
            self.menuDatabase.removeAll()
            guard let dictionaries = snapshot.value as? [String: Any] else { return }
            dictionaries.forEach({ (key, value) in
                let newItemCategory = MenuCategory()
                newItemCategory.name = key

                guard let testvalue = value as? [String: Any] else { return }
                for eachValue in testvalue {
                    guard let value = eachValue.value as? [String: Any] else {return}
                    let item = MenuItem(dictionary: value)
                    newItemCategory.items.append(item)
//                    print("eachvalue", eachValue.value)
                }
                self.menuDatabase.append(newItemCategory)
            })
            completion()
        }

//        ref.observe(.value, with: { (snapshot) in
//
//            self.menuDatabase.removeAll()
//            guard let dictionaries = snapshot.value as? [String: Any] else { return }
//            dictionaries.forEach({ (key, value) in
//                let newItemCategory = MenuCategory()
//                newItemCategory.name = key
//
//                guard let testvalue = value as? [String: Any] else { return }
//                for eachValue in testvalue {
//                    guard let value = eachValue.value as? [String: Any] else {return}
//                    let item = MenuItem(dictionary: value)
//                    newItemCategory.items.append(item)
//                    print("eachvalue", eachValue.value)
//                }
//                self.menuDatabase.append(newItemCategory)
//            })
//            completion()
//        })
        
    }
    
    func fetchHeaderImages(completion: @escaping () -> ()) {
        
        ref2.observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionaries = snapshot.value as? [String: Any] else { return }
            dictionaries.forEach({ (key, value) in
                guard let testvalue = value as? [String: Any] else { return }
                for eachValue in testvalue {
                    guard let value = eachValue.value as? [String: String] else {return}
                    guard let imageString = value["Image"] as? String else {return}
                    print("Image String", imageString)
                    self.frontpageDatabase.append(imageString)
                }
            })
            completion()
        }
    }
    
}
