//
//  ViewController.swift
//  BullsEye
//
//  Created by coskun on 2.07.2017.
//  Copyright (c) 2017 cskncnr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnHitMe: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnHitMe_ShowAlert(sender: UIButton) {
        let alert = UIAlertController(title: "Hello,", message: "You Win The Game!", preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "Awesome", style: UIAlertActionStyle.Default, handler: nil)
        
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }

}

