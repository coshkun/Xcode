//
//  ViewController.swift
//  MyCosLess2
//
//  Created by coskun on 18.06.2017.
//  Copyright (c) 2017 coskun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblBaslik: UILabel!
    @IBOutlet weak var txtGiris: UITextField!
    
    @IBAction func btnGonder(sender: UIButton) {
        lblBaslik.text = txtGiris.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

