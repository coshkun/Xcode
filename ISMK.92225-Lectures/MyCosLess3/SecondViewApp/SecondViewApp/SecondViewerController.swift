//
//  SecondViewerController.swift
//  SecondViewApp
//
//  Created by coskun on 20.06.2017.
//  Copyright (c) 2017 cskncnr. All rights reserved.
//

import UIKit

class SecondViewerController: UIViewController {
    
    var name: String = ""

    @IBOutlet weak var lblMesaj: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblMesaj.text  = self.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnGeriDon(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
