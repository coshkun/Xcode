//
//  ViewController.swift
//  TableViewController
//
//  Created by coskun on 21.06.2017.
//  Copyright (c) 2017 cskncnr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var detailTitle: String = ""
    
    @IBOutlet weak var lblDetailTitle: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblDetailTitle.text = detailTitle
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

