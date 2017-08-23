//
//  CheckList.swift
//  iCheck
//
//  Created by coskun on 10.08.2017.
//  Copyright (c) 2017 cskncnr. All rights reserved.
//

import UIKit

class CheckList: NSObject, NSCoding {
    var name = ""
    var items = [CheckListItem]()
    var iconName: String
    
    convenience init(name: String){
        self.init(name: name, iconName: "No Icon")
    }
    
    init(name: String, iconName icon: String){
        self.name = name
        self.iconName = icon
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("Name") as! String
        items = aDecoder.decodeObjectForKey("Items") as! [CheckListItem]
        iconName = aDecoder.decodeObjectForKey("IconName") as! String
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "Name")
        aCoder.encodeObject(items, forKey: "Items")
        aCoder.encodeObject(iconName, forKey: "IconName")
    }
    
    func countUncheckedItems() -> Int {
        var count = 0
        
        for item in items {
            if !item.checked {
                count += 1
            }
        }
        
        return count
    }
}
