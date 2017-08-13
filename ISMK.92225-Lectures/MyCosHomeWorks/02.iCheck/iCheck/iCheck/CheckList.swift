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
    
    init(name: String){
        self.name = name
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("Name") as! String
        items = aDecoder.decodeObjectForKey("Items") as! [CheckListItem]
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "Name")
        aCoder.encodeObject(items, forKey: "Items")
    }
}
