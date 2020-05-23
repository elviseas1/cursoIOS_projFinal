//
//  FIRDataOption.swift
//  testeImagePicker
//
//  Created by Elvis Silveira on 21/05/20.
//  Copyright © 2020 Elvis Silveira. All rights reserved.
//

import UIKit
import FirebaseDatabase

class FIRDataObject : NSObject {
    
    let snapShot : DataSnapshot
    @objc var key : String { return snapShot.key }
    
    required init(snapShot : DataSnapshot){
        self.snapShot = snapShot
        
        super.init()
        
        for child in snapShot.children.allObjects as? [DataSnapshot] ?? [] {
            if responds(to: Selector(child.key)){
                setValue(child.value, forKey: child.key)
            }
        }
    }
}
