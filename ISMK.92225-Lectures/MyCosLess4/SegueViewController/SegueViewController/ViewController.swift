//
//  ViewController.swift
//  SegueViewController
//
//  Created by coskun on 21.06.2017.
//  Copyright (c) 2017 cskncnr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtInputBox: UITextField!
    @IBOutlet weak var btnSend: UIButton!
    
    @IBAction func btnSend(sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SeconViewSegue" {
            let sc = (segue.destinationViewController as! SecondViewController)
            sc.myTitle = txtInputBox.text
        }
    }

}

