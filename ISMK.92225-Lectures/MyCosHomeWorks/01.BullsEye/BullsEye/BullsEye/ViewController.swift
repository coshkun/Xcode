//
//  ViewController.swift
//  BullsEye
//
//  Created by coskun on 2.07.2017.
//  Copyright (c) 2017 cskncnr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sldrBull: UISlider!
    @IBOutlet weak var btnHitMe: UIButton!
    @IBOutlet weak var lblTarget: UILabel!
    
    var HitValue:Int = 50
    var TargetValue:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        HitValue = lroundf(sldrBull.value)
        TargetValue = newTarget()
        lblTarget.text = "Put the Bull's Eye as close as you can to: \(TargetValue)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnHitMe_ShowAlert(sender: UIButton) {
        var msg:String = "The value of the slider is now: \(HitValue)"
        let alert = UIAlertController(title: "Hello,", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }

    @IBAction func sldrBull_ValueChanged(sender: UISlider, forEvent event: UIEvent) {
        HitValue = lroundf(sender.value)
        //print("\nThe value of the slider is now: \(HitValue)")
    }
    
    func newTarget() -> Int {
        return (1 + Int(arc4random_uniform(100)))
    }
}

