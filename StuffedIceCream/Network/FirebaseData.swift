//
//  FirebaseData.swift
//  StuffedIceCream
//
//  Created by Eldon Chan on 2/3/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//

import FirebaseDatabase
import FirebaseAuth

class FireBaseData {
    
    static let sharedInstance = FireBaseData()
    var menuDatabase = [MenuCategory]()
    var frontpageDatabase = [HeaderItem]()
    var currentUser: User?

    func fetchMenuData(completion: @escaping () -> ()) {
        
        let ref = Database.database().reference().child("Menu")
        ref.observeSingleEvent(of: .value) { (snapshot) in
            self.menuDatabase.removeAll()
            guard let dictionaries = snapshot.value as? [String: Any] else { return }
            dictionaries.forEach({ (key, value) in
                let newItemCategory = MenuCategory()
                newItemCategory.name = String(key.dropFirst())

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
    }
    
    func fetchHeaderImages(completion: @escaping () -> ()) {
        
        let ref = Database.database().reference().child("Frontpage")
        ref.observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionaries = snapshot.value as? [String: Any] else { return }
            dictionaries.forEach({ (key, value) in
                guard let testvalue = value as? [String: Any] else { return }
                for eachValue in testvalue {
                    guard let value = eachValue.value as? [String: String] else {return}
//                    guard let imageString = value["Image"] as? String else {return}
//                    print("Image String", imageString)
                    let item = HeaderItem(dictionary: value)
                    self.frontpageDatabase.append(item)
                }
            })
            completion()
        }
    }
    
    func fetchUserInfo(completion: @escaping () -> ()) {
        
        let ref = Database.database().reference().child("Users")
        ref.observeSingleEvent(of: .value) { (snapshot) in
            
            guard let currentUID = Auth.auth().currentUser?.uid else {return}
            guard let dictionaries = snapshot.value as? [String: Any] else { return }
            dictionaries.forEach({ (key, value) in
                
                if key == currentUID {
                    guard let uservalue = value as? [String: Any] else {return}
                    let user = User(dictionary: uservalue)
                    print("USER: ", user.name)
                    print("USER: ", user.birthday)
                    self.currentUser = user
                    print("CURRENT USER: ", self.currentUser?.name)
                }

            })
            

            
        }
    }
    
    
    
}
