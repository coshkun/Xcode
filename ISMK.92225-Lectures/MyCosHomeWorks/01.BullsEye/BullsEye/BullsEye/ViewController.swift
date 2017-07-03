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
    @IBOutlet weak var lblRound: UILabel!
    @IBOutlet weak var lblSkore: UILabel!
    @IBOutlet weak var btnStartGame: UIButton!
    
    var HitValue:Int = 0
    var TargetValue:Int = 0
    var RoundCounter:Int = 0
    var Skore:Int = 0
    let SnapTolerence:Int = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        HitValue = lroundf(sldrBull.value)
        TargetValue = newTarget()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnHitMe_ShowAlert(sender: UIButton) {
        var newSP:Int = 0
        var newTitle:String = "Not So Bad,"
        
        if TargetValue==HitValue {
            newSP = TargetValue*2
            newTitle = "Boom! x2 Multiplier for Bull's Eye"
        }
        else if abs(TargetValue - HitValue) <= SnapTolerence {
            newSP = TargetValue
            newTitle = "Nice Try!"
        }
        else {
            newSP = 100 - abs(TargetValue - HitValue)
        }
        
        var msg:String = "The value of the slider is now: \(HitValue)"
            // + "\nThe target value was: \(TargetValue)"
            + "\nYou win \(newSP) points on this round."
        
        let alert = UIAlertController(title: newTitle, message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { action in self.updateSkores(newSP) })
        
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }

    @IBAction func sldrBull_ValueChanged(sender: UISlider, forEvent event: UIEvent) {
        HitValue = lroundf(sender.value)
        //print("\nThe value of the slider is now: \(HitValue)")
    }
    @IBAction func btnStartGame_Start(sender: AnyObject) {
        Skore = 0
        RoundCounter = 0
        sldrBull.value = 50
        HitValue = 50
        TargetValue = newTarget()
        updateLabels()
    }
    
    func newTarget() -> Int {
        RoundCounter++
        return (1 + Int(arc4random_uniform(100)))
    }
    
    func updateSkores(newSkorePoints:Int){
        Skore += newSkorePoints
        TargetValue = newTarget()
        updateLabels()
    }
    
    func updateLabels(){
        lblTarget.text = "Put the Bull's Eye as close as you can to: \(TargetValue)"
        lblRound.text = "Round: \(RoundCounter)"
        lblSkore.text = "Skore: \(Skore)"
    }
}

