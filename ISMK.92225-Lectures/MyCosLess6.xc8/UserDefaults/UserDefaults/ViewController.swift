//
//  ViewController.swift
//  UserDefaults
//
//  Created by ios on 9.08.2017.
//  Copyright © 2017 ismek. All rights reserved.
//

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
    
    @IBOutlet weak var txtInput: UITextField!
    @IBOutlet weak var txtOutput: UITextField!
    
    @IBAction func btnOK_action(_ sender: UIButton) {
        txtOutput.text = txtInput.text
        UserDefaults.standard.set(txtInput.text, forKey: "Input")
        txtInput.text = ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let str = UserDefaults.standard.object(forKey: "Input") as? String {
         txtOutput.text = str
        }
    }


}

