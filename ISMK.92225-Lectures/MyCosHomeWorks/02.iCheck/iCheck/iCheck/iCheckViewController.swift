//
//  ViewController.swift
//  iCheck
//
//  Created by coskun on 23.07.2017.
//  Copyright (c) 2017 cskncnr. All rights reserved.
//

import UIKit

class iCheckViewController: UITableViewController, ItemDetailViewControllerDelegate {
    var items : [CheckListItem]
    @IBOutlet weak var btnAdd: UIBarButtonItem!
    
    
    required init?(coder aDecoder: NSCoder) {
        items = [CheckListItem]()
        
        let row0item = CheckListItem()
        row0item.text = "Walk the dog"
        row0item.checked = false
        items.append(row0item)
        
        let row1item = CheckListItem()
        row1item.text = "Brush your teeth"
        row1item.checked = true
        items.append(row1item)
        
        let row2item = CheckListItem()
        row2item.text = "Learn iOS development"
        row2item.checked = true
        items.append(row2item)
        
        let row3item = CheckListItem()
        row3item.text = "Play SWGOH again"
        row3item.checked = false
        items.append(row3item)
        
        let row4item = CheckListItem()
        row4item.text = "Get some sleep"
        row4item.checked = false
        items.append(row4item)
        
        super.init(coder: aDecoder)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem",
                                                                forIndexPath: indexPath) as! UITableViewCell
        let item = items[indexPath.row]
        
        configureText(cell, with: item)
        configureCheckmark(cell, with: item)
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath)
        {
            let item = items[indexPath.row]
            item.toggleChecked()
            configureCheckmark(cell, with: item)
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        items.removeAtIndex(indexPath.row)
        let itms = [indexPath]
        tableView.deleteRowsAtIndexPaths(itms, withRowAnimation: .Automatic)
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
        let newRowIdex = items.count
        items.append(item)
        
        let indexPath = NSIndexPath(forRow: newRowIdex, inSection: 0)
        let indexPaths = [indexPath]
        
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Automatic)
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func itemDetailViewController(controller: ItemDetailViewController, didFinishEditing item: CheckListItem) {
        if let index = (items as NSArray).indexOfObject(item) as Int? {
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            if let cell = tableView.cellForRowAtIndexPath(indexPath){
                configureText(cell, with: item)
            }
        }
        dismissViewControllerAnimated(true, completion: nil)
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
                viewCtrl.itemToEdit = items[indexPath.row]
            }
        }
    }
}







