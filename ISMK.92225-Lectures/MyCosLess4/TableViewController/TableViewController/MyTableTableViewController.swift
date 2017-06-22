//
//  MyTableTableViewController.swift
//  TableViewController
//
//  Created by coskun on 21.06.2017.
//  Copyright (c) 2017 cskncnr. All rights reserved.
//

import UIKit

class MyTableTableViewController: UITableViewController {
// myCell'in tag'i 1 verildi
    
    var students: [String] = ["Veysel","Nazım","Emre","Taner","Cengiz","Taner","Furkan Topal","Furkan Özdemir","Taner","Coşkun"]
    
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

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1  //Kısım Sayısı burdan ayarlnır.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return students.count  //Cell (Satır) Sayısı burdan ayarlanır.
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        
        let label = cell.viewWithTag(1) as! UILabel
        /*
        if (indexPath.row % 5 == 0) {
            label.text = "Ben 5'te biriyim.."
        }
        else if indexPath.row % 5 == 1 {
            label.text = "Ben de onun arkasından gelen 1.yim"
        }
        else if indexPath.row % 5 == 2 {
            label.text = "Ben de onun arkasından gelen 2.yim"
        }
        else if indexPath.row % 5 == 3 {
            label.text = "Ben de onun arkasından gelen 3.yüm"
        }
        else if indexPath.row % 5 == 4 {
            label.text = "Ben de onun arkasından gelen 4.yüm"
        }
        */
        label.text = students[indexPath.row]
        
        return cell
    }

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
        if segue.identifier == "myCellDetailSegue" {
            let vc = (segue.destinationViewController as! ViewController)
            
            if let indexPath = tableView.indexPathForCell(sender as! UITableViewCell) {
                vc.detailTitle = students[indexPath.row]
            }
        }
    }
    

}
