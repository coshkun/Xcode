//
//  ViewController.swift
//  iCheck
//
//  Created by coskun on 23.07.2017.
//  Copyright (c) 2017 cskncnr. All rights reserved.
//

import UIKit

class iCheckViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: AnyObject = tableView.dequeueReusableCellWithIdentifier("ChecklistItem", forIndexPath: indexPath)
        let label = cell.viewWithTag(1000) as! UILabel
        
        if indexPath.row % 5 == 0 {
            label.text = "Walk the dog!"
        }
        else if indexPath.row % 5 == 1 {
            label.text = "Brush your teeth"
        }
        else if indexPath.row % 5 == 2 {
            label.text = "Learn IOS development"
        }
        else if indexPath.row % 5 == 3 {
            label.text = "Play SWGOH again"
        }
        else if indexPath.row % 5 == 4 {
            label.text = "Eat ice-cream"
        }
        
        return cell as! UITableViewCell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            if cell.accessoryType == .None { // UITableViewCellAccessoryType.Checkmark
                cell.accessoryType = .Checkmark
            }
            else {
                cell.accessoryType = .None
            }
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

