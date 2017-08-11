//
//  AllListsViewController.swift
//  iCheck
//
//  Created by coskun on 10.08.2017.
//  Copyright (c) 2017 cskncnr. All rights reserved.
//

import UIKit

class AllListsViewController: UITableViewController, ListDetailViewControllerDelegate {
    
    var lists: [CheckList]
    
    required init!(coder aDecoder: NSCoder!) {
        lists = [CheckList]()
        super.init(coder: aDecoder)
        
        var lst = CheckList(name: "Birthdays")
        lists.append(lst)
        
        lst = CheckList(name: "Groceries")
        lists.append(lst)
        
        lst = CheckList(name: "Cool Apps")
        lists.append(lst)
        
        lst = CheckList(name: "To Do")
        lists.append(lst)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    /*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 0
    }
    */
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return lists.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        let cell = makeCell(tableView)
        // cell.textLabel!.text = "List \(indexPath.row)"
        
        let list = lists[indexPath.row]
        cell.textLabel!.text = list.name
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    func makeCell(tableView: UITableView) -> UITableViewCell {
        let cellID = "Cell"
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellID) as? UITableViewCell {
            return cell
        }
        else {
            return UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellID)
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let checklist = lists[indexPath.row]
        performSegueWithIdentifier("ShowChecklistSegue", sender: checklist)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            lists.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//            performSegueWithIdentifier("ShowChecklistSegue", sender: lists[indexPath.row] as CheckList)
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowChecklistSegue" {
            let controller = segue.destinationViewController as! iCheckViewController
            controller.checklist = sender as! CheckList
        }
        else if segue.identifier == "AddChecklistSegue" {
            let controller = segue.destinationViewController as! UINavigationController
            let ctrl = controller.topViewController as! ListDetailViewController
            ctrl.delegate = self
            ctrl.listToEdit = nil
        }
    }
    
    // DELEGATES: - implementation
    func listDetailViewControllerDidCancel(controller: ListDetailViewController) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func listDetailViewController(controller: ListDetailViewController, didFinishAdding checklist: CheckList) {
        
        let newRowIndex = lists.count
        lists.append(checklist)
        
        let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
        let paths = [indexPath]
        
        tableView.insertRowsAtIndexPaths(paths, withRowAnimation: UITableViewRowAnimation.Automatic)
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func listDetailViewController(controller: ListDetailViewController, didFinishEditing checklist: CheckList) {
        
        if let index = (lists as NSArray).indexOfObject(checklist) as Int? {
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            if let cell = tableView.cellForRowAtIndexPath(indexPath) {
                cell.textLabel!.text = checklist.name
                // update original datasource (lists) here
                // lists[indexPath.row] = checklist
            }
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}




