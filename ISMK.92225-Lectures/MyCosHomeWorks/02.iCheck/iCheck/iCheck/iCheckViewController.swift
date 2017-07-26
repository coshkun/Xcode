//
//  ViewController.swift
//  iCheck
//
//  Created by coskun on 23.07.2017.
//  Copyright (c) 2017 cskncnr. All rights reserved.
//

import UIKit

class iCheckViewController: UITableViewController {
    var items : [CheckListItem]
    
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
    
    func configureCheckmark(cell: UITableViewCell, with item: CheckListItem) {
        
        if item.checked {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
    }
    
    func configureText(cell: UITableViewCell, with item: CheckListItem){
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
}







