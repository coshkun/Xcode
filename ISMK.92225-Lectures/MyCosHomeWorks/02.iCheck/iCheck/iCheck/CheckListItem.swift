//
//  CheckListItem.swift
//  iCheck
//
//  Created by coskun on 25.07.2017.
//  Copyright (c) 2017 cskncnr. All rights reserved.
//

import Foundation

class CheckListItem{
    var text = ""
    var checked = false
    
    func toggleChecked(){
        checked = !checked
    }
}