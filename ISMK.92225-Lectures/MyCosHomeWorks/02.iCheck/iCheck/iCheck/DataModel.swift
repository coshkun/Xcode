//
//  DataModel.swift
//  iCheck
//
//  Created by coskun on 13.08.2017.
//  Copyright (c) 2017 cskncnr. All rights reserved.
//

import Foundation

class DataModel {
    var lists = [CheckList]()
    
    var indexOfSelectedChecklist: Int {
        get {
            return NSUserDefaults.standardUserDefaults().integerForKey("ChecklistIndex")
        }
        set {
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "ChecklistIndex")
        }
    }
    
    init(){
        loadChecklists()
        registerDefaultValues()
        handleFirstTimeUse()
    }
    
    // FILE SYSTEM
    func documentsDirectory() -> NSURL{
        let paths = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask)
        return paths[0] as! NSURL
    }
    func dataFilePath() -> NSURL {
        return documentsDirectory().URLByAppendingPathComponent("iCheckSave.plist")
    }
    func saveChecklists(){
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        archiver.encodeObject(lists, forKey: "Checklists")
        archiver.finishEncoding()
        data.writeToURL(dataFilePath(), atomically: true)
    }
    func loadChecklists(){
        let path = dataFilePath().path
        if let data = NSData(contentsOfFile: path!) {
            let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
            lists = unarchiver.decodeObjectForKey("Checklists") as! [CheckList]
            unarchiver.finishDecoding()
            sortChecklist()
        }
        
    }
    // USER DEFAULTS
    func registerDefaultValues(){
        let dictionary: [NSString:NSObject] = ["ChecklistIndex" : -1, "FirstUse": true]
        let userdef = NSUserDefaults()
        
        NSUserDefaults.standardUserDefaults().registerDefaults(dictionary)
    }
    // First Install
    func handleFirstTimeUse(){
        let userdef = NSUserDefaults.standardUserDefaults()
        let firstTime = userdef.boolForKey("FirstUse")
        
        if firstTime {
            let cl = CheckList(name: "My First List")
            lists.append(cl)
            
            indexOfSelectedChecklist = 0
            userdef.setBool(false, forKey: "FirstUse")
            userdef.synchronize()
        }
    }
    // Sorting
    func sortChecklist(){
        lists.sort { $0.name < $1.name }
    }
}