//
//  ViewController.swift
//  iCheck
//
//  Created by coskun on 23.07.2017.
//  Copyright (c) 2017 cskncnr. All rights reserved.
//

import UIKit

class iCheckViewController: UITableViewController, ItemDetailViewControllerDelegate {
    //var items : [CheckListItem]
    var checklist: CheckList!
    @IBOutlet weak var btnAdd: UIBarButtonItem!
    @IBOutlet weak var navBar: UINavigationItem!
    
    /*
    required init?(coder aDecoder: NSCoder) {
        //items = [CheckListItem]()
        
        super.init(coder: aDecoder)
        // print("Documents folder is \(documentsDirectory())")
        // print("Data file path is \(dataFilePath())")
        // loadChecklistItems()
    }
    */

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navBar.title = checklist.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checklist.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem",
                                                                forIndexPath: indexPath) as! UITableViewCell
        let item = checklist.items[indexPath.row]
        
        configureText(cell, with: item)
        configureCheckmark(cell, with: item)
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath)
        {
            let item = checklist.items[indexPath.row]
            item.toggleChecked()
            configureCheckmark(cell, with: item)
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        //saveChecklistItems()
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        checklist.items.removeAtIndex(indexPath.row)
        let itms = [indexPath]
        tableView.deleteRowsAtIndexPaths(itms, withRowAnimation: .Automatic)
        //saveChecklistItems()
    }
    
    func configureCheckmark(cell: UITableViewCell, with item: CheckListItem) {
        let chkMark = cell.viewWithTag(1001) as! UILabel
        
        if item.checked {
            //cell.accessoryType = .Checkmark
            chkMark.hidden = false
        } else {
            //cell.accessoryType = .None
            chkMark.hidden = true
        }
    }
    
    func configureText(cell: UITableViewCell, with item: CheckListItem){
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    /* @IBAction func btnAdd_Click(sender: UIBarButtonItem) {
        let newRowIndex = items.count
        
        let item = CheckListItem()
        item.text = "i am new row"
        item.checked = false
        items.append(item)
        
        let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
        let indexPaths = [indexPath]
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Automatic)
    } */
    
    func itemDetailViewControllerDidCancel(controller: ItemDetailViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func itemDetailViewController(controller: ItemDetailViewController, didFinishAdding item: CheckListItem) {
        let newRowIdex = checklist.items.count
        checklist.items.append(item)
        
        let indexPath = NSIndexPath(forRow: newRowIdex, inSection: 0)
        let indexPaths = [indexPath]
        
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Automatic)
        
        dismissViewControllerAnimated(true, completion: nil)
        //saveChecklistItems()
    }
    
    func itemDetailViewController(controller: ItemDetailViewController, didFinishEditing item: CheckListItem) {
        if let index = (checklist.items as NSArray).indexOfObject(item) as Int? {
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            if let cell = tableView.cellForRowAtIndexPath(indexPath){
                configureText(cell, with: item)
            }
        }
        dismissViewControllerAnimated(true, completion: nil)
        //saveChecklistItems()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddItemSegue" {
            let naviCtrl = segue.destinationViewController as! UINavigationController
            let viewCtrl = naviCtrl.topViewController as! ItemDetailViewController
            viewCtrl.delegate = self
        }
        else if segue.identifier == "EditItemSegue" {
            let naviCtrl = segue.destinationViewController as! UINavigationController
            let viewCtrl = naviCtrl.topViewController as! ItemDetailViewController
            viewCtrl.delegate = self
            
            if let indexPath = tableView.indexPathForCell(sender as! UITableViewCell) {
                viewCtrl.itemToEdit = checklist.items[indexPath.row]
            }
        }
    }
    
    // File Operations
    /*
    func documentsDirectory() -> NSURL {
        let fm = NSFileManager.defaultManager()
        let paths = fm.URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains:NSSearchPathDomainMask.UserDomainMask)
        
        return paths[0] as! NSURL
    }
    
    func dataFilePath() -> NSURL {
        return documentsDirectory().URLByAppendingPathComponent("iCheckSave.plist")
    }
    
    func saveChecklistItems() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        archiver.encodeObject(items, forKey: "ChecklistItems")
        archiver.finishEncoding()
        data.writeToURL(dataFilePath(), atomically: true)
    }
    
    func loadChecklistItems(){
        let path = dataFilePath().path
        if let data = NSData(contentsOfFile: path!) {
            let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
            items = unarchiver.decodeObjectForKey("ChecklistItems") as! [CheckListItem]
            unarchiver.finishDecoding()
        }
    }
    */
}







