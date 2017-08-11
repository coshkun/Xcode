//
//  ItemDetailViewController.swift
//  iCheck
//
//  Created by coskun on 30.07.2017.
//  Copyright (c) 2017 cskncnr. All rights reserved.
//

import Foundation
import UIKit

protocol ItemDetailViewControllerDelegate: class {
    func itemDetailViewControllerDidCancel(controller: ItemDetailViewController)
    func itemDetailViewController(controller: ItemDetailViewController, didFinishAdding item: CheckListItem)
    func itemDetailViewController(controller: ItemDetailViewController, didFinishEditing item: CheckListItem)
}

class ItemDetailViewController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var btnDone: UIBarButtonItem!
    @IBOutlet weak var btnCancel: UIBarButtonItem!
    @IBOutlet weak var txtAddItem: UITextField!
    @IBOutlet weak var navBar: UINavigationItem!

    
    weak var delegate: ItemDetailViewControllerDelegate?
    weak var itemToEdit: CheckListItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let item = itemToEdit {
            navBar.title = "Edit Item"
            txtAddItem.text = item.text
            btnDone.enabled = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        txtAddItem.becomeFirstResponder()
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let oldText = textField.text! as NSString
        let newText = oldText.stringByReplacingCharactersInRange(range, withString: string) as NSString
        
        
        btnDone.enabled = (newText.length > 0)
        return true
    }
    
    @IBAction func txtAddItem_DidEndOnExit(sender: UITextField) {
        done()
    }
    
    @IBAction func btnDone_Click(sender: UIBarButtonItem) {
        done()
    }
    
    @IBAction func btnCancel_Click(sender: UIBarButtonItem) {
        // dismissViewControllerAnimated(true, completion: nil)
        delegate?.itemDetailViewControllerDidCancel(self)
    }
    
    
    func done(){
        //dismissViewControllerAnimated(true, completion: nil)
        if let item = itemToEdit {
            item.text = txtAddItem.text!
            delegate?.itemDetailViewController(self, didFinishEditing: item)
        }
        else {
            let item = CheckListItem()
            item.text = txtAddItem.text!
            item.checked = false
            
            delegate?.itemDetailViewController(self, didFinishAdding: item)
        }
    }
    
    
    
    
    
}