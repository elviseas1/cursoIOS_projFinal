//
//  AppInfo.swift
//  testeImagePicker
//
//  Created by Elvis Silveira on 21/05/20.
//  Copyright © 2020 Elvis Silveira. All rights reserved.
//


import Foundation
import FirebaseDatabase

class AppInfo : FIRDataObject{
    @objc var name : String = ""
    @objc var price : Int = 0
    @objc var imageURL : String = ""
    
    var dictionaryRepresentation : [String : Any] {
        return [
            "name" : name,
            "price" : price,
            "imageURL" : imageURL
        ]
    }
    
    init(name: String, price: Int, imageURL: String){
        super.init(snapShot: DataSnapshot())
        self.name = name
        self.price = price
        self.imageURL = imageURL
    }
    
    required init(snapShot: DataSnapshot){
        super.init(snapShot: snapShot)
    }
}
