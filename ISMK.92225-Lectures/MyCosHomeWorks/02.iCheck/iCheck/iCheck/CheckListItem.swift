//
//  CheckListItem.swift
//  iCheck
//
//  Created by coskun on 25.07.2017.
//  Copyright (c) 2017 cskncnr. All rights reserved.
//

import Foundation

class CheckListItem: NSObject, NSCoding{
    var text = ""
    var checked = false
    
    override init(){
        super.init()
    }
    
    func toggleChecked(){
        checked = !checked
    }
    
    //Serialization
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(text, forKey: "Text")
        aCoder.encodeObject(checked, forKey: "Checked")
    }
    required init(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObjectForKey("Text") as! String
        checked = aDecoder.decodeObjectForKey("Checked") as! Bool
        super.init()
    }
}