//
//  ListDetailViewController.swift
//  iCheck
//
//  Created by coskun on 10.08.2017.
//  Copyright (c) 2017 cskncnr. All rights reserved.
//

import UIKit

protocol ListDetailViewControllerDelegate: class {
    func listDetailViewControllerDidCancel(controller: ListDetailViewController)
    func listDetailViewController(controller: ListDetailViewController, didFinishAdding checklist: CheckList)
    func listDetailViewController(controller: ListDetailViewController, didFinishEditing checklist: CheckList)
}

class ListDetailViewController: UITableViewController, UITextFieldDelegate, IconPickerViewControllerDelegate {

    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var iconImageView: UIImageView!
    
    weak var delegate: ListDetailViewControllerDelegate?
    weak var listToEdit: CheckList?
         var iconName = "Folder"
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        if let list = listToEdit {
            navBar.title = "Edit Checklist"
            textField.text = list.name
            doneButton.enabled = true
            iconName = list.iconName
            iconImageView.image = UIImage(named: iconName)
        }
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
        return 1
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        if indexPath.section == 1 {
            return indexPath
        } else {
            return nil
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let oldtext = textField.text! as NSString
        let newtext = oldtext.stringByReplacingCharactersInRange(range, withString: string) as NSString
        doneButton.enabled = (newtext.length > 0)
        return true
    }
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
        if segue.identifier == "PickIconSegue" {
            let controller = segue.destinationViewController as! IconPickerViewController
            controller.delegate = self
        }
    }
    
    
    @IBAction func btnDone_Action(sender: UIBarButtonItem) {
        done()
    }
    
    @IBAction func btnCancel_Action(sender: UIBarButtonItem) {
        delegate?.listDetailViewControllerDidCancel(self)
    }
    
    @IBAction func textField_DidEndOnExit(sender: UITextField) {
        done()
    }
    
    func done(){
        //dismissViewControllerAnimated(true, completion: nil)
        if let list = listToEdit {
            list.name = textField.text!
            list.iconName = iconName
            delegate?.listDetailViewController(self, didFinishEditing: list)
        }
        else {
            let list = CheckList(name: textField.text!)
            list.iconName = iconName
            delegate?.listDetailViewController(self, didFinishAdding: list)
        }
    }
    
    func iconPicker(picker: IconPickerViewController, didPicked iconName: String) {
        self.iconName = iconName
        iconImageView.image = UIImage(named: iconName)
        let _ = navigationController?.popViewControllerAnimated(true)
        //dismissViewControllerAnimated(true, completion: nil)
    }
}
