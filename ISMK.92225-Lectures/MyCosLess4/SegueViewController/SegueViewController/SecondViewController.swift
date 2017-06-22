//
//  SecondViewController.swift
//  SegueViewController
//
//  Created by coskun on 21.06.2017.
//  Copyright (c) 2017 cskncnr. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var myTitle:String = ""
    
    @IBOutlet weak var lblSecondTitle: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblSecondTitle.text = myTitle
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
