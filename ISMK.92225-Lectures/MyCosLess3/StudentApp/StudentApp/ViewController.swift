//
//  ViewController.swift
//  StudentApp
//
//  Created by coskun on 19.06.2017.
//  Copyright (c) 2017 cskncnr. All rights reserved.
//

import UIKit

struct Note {
    var name:String
    var note:Int
    
    init(){
        name=""
        note=0
    }
}

class ViewController: UIViewController {
    var ad:String = "", soyad:String = ""
    var no:Int = 1
    var notes:[Note] = []
    
    @IBOutlet weak var txtGiris: UITextField!
    @IBOutlet weak var lblOutput: UILabel!
    
    @IBAction func btnCalculate(sender: UIButton) {
        var tmp = txtGiris.text!
        if let no: Int = tmp.toInt(){
            find(no)
        }
        else {
            let tmp2 = tmp.componentsSeparatedByString(" ")
            let ad = tmp2[0]
            let soyad = tmp2[1]
        }
    }
    
    func find(no:Int){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //sample context
        self.ad = "Coskun"
        self.soyad = "Caner"
        self.no = 10
        var sampleNote = Note()
        sampleNote.name = "Mat1"
        sampleNote.note = 85
        self.notes.append(sampleNote)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

