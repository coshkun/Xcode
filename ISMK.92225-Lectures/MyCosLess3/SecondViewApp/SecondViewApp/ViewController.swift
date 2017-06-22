//
//  ViewController.swift
//  SecondViewApp
//
//  Created by coskun on 20.06.2017.
//  Copyright (c) 2017 cskncnr. All rights reserved.
//

/* 
    
*/

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "secondViewerSegue" {
            (segue.destinationViewController as! SecondViewerController).name = "Sa,Ben 1'den geldim"
        }
    }

}

